//-----------------------------------------------------------------------------
// Screen grab utility
// - This needs to link against libpng and libx11
//-----------------------------------------------------------------------------
#include <stdio.h>
#include <math.h>
#include <malloc.h>
#include <X11/Xlib.h>
#include <X11/X.h>
#include <png.h>
#include <errno.h>

int main(int argc, char *argv[])
{
	const char* title = NULL;
	XWindowAttributes gwa;
	int result = 0;
	FILE *fp = NULL;
	int width, height;
	int x, y;
	png_structp png_ptr = NULL;
	png_infop info_ptr = NULL;
	png_bytep row = NULL;
	if (argc < 2)
	{
		fprintf(stderr, "usage: %s <outputFileName> <optionalTitle>\n", argv[0]);
		return 1;
	}
	char* filename = argv[1];
	if (argc == 3)
		title = argv[2];
	else
		title = "screengrab";

	Display *display = XOpenDisplay(":0.0");
	if (display == NULL)
	{
		fprintf(stderr, "couldn't open display\n");
		return 1;
	}
	Window root = DefaultRootWindow(display);

	XGetWindowAttributes(display, root, &gwa);
	width = gwa.width;
	height = gwa.height;

	XImage *image = XGetImage(display,root, 0,0 , width,height,AllPlanes, ZPixmap);
	
	fp = fopen(filename, "wb");
	if (fp == NULL)
	{
		fprintf(stderr, "Could not open file %s for writing\n", filename);
		result = 1;
		goto finish;
	}

	png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
	if (png_ptr == NULL) {
		fprintf(stderr, "Error creating png\n");
		result = 1;
		goto finish;
	}

	// Initialize info structure
	info_ptr = png_create_info_struct(png_ptr);
	if (info_ptr == NULL) {
		fprintf(stderr, "Error during png creation\n");
		result = 1;
		goto finish;
	}

	// Setup Exception handling
	if (setjmp(png_jmpbuf(png_ptr))) {
		fprintf(stderr, "Error during png creation\n");
		result = 1;
		goto finish;
	}

	png_init_io(png_ptr, fp);

	png_set_IHDR(png_ptr, info_ptr, width, height,
			8, PNG_COLOR_TYPE_RGB, PNG_INTERLACE_NONE,
			PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);

	png_text title_text;
	title_text.compression = PNG_TEXT_COMPRESSION_NONE;
	title_text.key = (png_charp)"Title";
	title_text.text = (png_charp)title;
	png_set_text(png_ptr, info_ptr, &title_text, 1);

	png_write_info(png_ptr, info_ptr);

	row = (png_bytep) malloc(3 * width * sizeof(png_byte));

	for (y=0 ; y<height ; y++)
	{
		for (x=0 ; x<width ; x++)
		{
			unsigned long pixel = XGetPixel(image,x,y);
			(&row[x*3])[0] = (pixel & image->red_mask   ) >> 16;
			(&row[x*3])[1] = (pixel & image->green_mask ) >> 8;
			(&row[x*3])[2] = (pixel & image->blue_mask  );
		}
		png_write_row(png_ptr, row);
	}

	// End write
	png_write_end(png_ptr, NULL);

finish:
	if (fp != NULL)
		fclose(fp);
	if (info_ptr != NULL)
		png_free_data(png_ptr, info_ptr, PNG_FREE_ALL, -1);
	if (png_ptr != NULL)
		png_destroy_write_struct(&png_ptr, (png_infopp)NULL);
	if (row != NULL)
		free(row);

	return result;
}

