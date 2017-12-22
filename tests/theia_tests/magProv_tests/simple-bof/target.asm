
target:     file format elf32-i386


Disassembly of section .init:

080483ac <_init>:
 80483ac:	53                   	push   %ebx
 80483ad:	83 ec 08             	sub    $0x8,%esp
 80483b0:	e8 00 00 00 00       	call   80483b5 <_init+0x9>
 80483b5:	5b                   	pop    %ebx
 80483b6:	81 c3 3f 1c 00 00    	add    $0x1c3f,%ebx
 80483bc:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 80483c2:	85 c0                	test   %eax,%eax
 80483c4:	74 05                	je     80483cb <_init+0x1f>
 80483c6:	e8 75 00 00 00       	call   8048440 <__gmon_start__@plt>
 80483cb:	83 c4 08             	add    $0x8,%esp
 80483ce:	5b                   	pop    %ebx
 80483cf:	c3                   	ret    

Disassembly of section .plt:

080483d0 <printf@plt-0x10>:
 80483d0:	ff 35 f8 9f 04 08    	pushl  0x8049ff8
 80483d6:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 80483dc:	00 00                	add    %al,(%eax)
	...

080483e0 <printf@plt>:
 80483e0:	ff 25 00 a0 04 08    	jmp    *0x804a000
 80483e6:	68 00 00 00 00       	push   $0x0
 80483eb:	e9 e0 ff ff ff       	jmp    80483d0 <_init+0x24>

080483f0 <fgets@plt>:
 80483f0:	ff 25 04 a0 04 08    	jmp    *0x804a004
 80483f6:	68 08 00 00 00       	push   $0x8
 80483fb:	e9 d0 ff ff ff       	jmp    80483d0 <_init+0x24>

08048400 <fclose@plt>:
 8048400:	ff 25 08 a0 04 08    	jmp    *0x804a008
 8048406:	68 10 00 00 00       	push   $0x10
 804840b:	e9 c0 ff ff ff       	jmp    80483d0 <_init+0x24>

08048410 <err@plt>:
 8048410:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 8048416:	68 18 00 00 00       	push   $0x18
 804841b:	e9 b0 ff ff ff       	jmp    80483d0 <_init+0x24>

08048420 <fread@plt>:
 8048420:	ff 25 10 a0 04 08    	jmp    *0x804a010
 8048426:	68 20 00 00 00       	push   $0x20
 804842b:	e9 a0 ff ff ff       	jmp    80483d0 <_init+0x24>

08048430 <puts@plt>:
 8048430:	ff 25 14 a0 04 08    	jmp    *0x804a014
 8048436:	68 28 00 00 00       	push   $0x28
 804843b:	e9 90 ff ff ff       	jmp    80483d0 <_init+0x24>

08048440 <__gmon_start__@plt>:
 8048440:	ff 25 18 a0 04 08    	jmp    *0x804a018
 8048446:	68 30 00 00 00       	push   $0x30
 804844b:	e9 80 ff ff ff       	jmp    80483d0 <_init+0x24>

08048450 <__libc_start_main@plt>:
 8048450:	ff 25 1c a0 04 08    	jmp    *0x804a01c
 8048456:	68 38 00 00 00       	push   $0x38
 804845b:	e9 70 ff ff ff       	jmp    80483d0 <_init+0x24>

08048460 <fopen@plt>:
 8048460:	ff 25 20 a0 04 08    	jmp    *0x804a020
 8048466:	68 40 00 00 00       	push   $0x40
 804846b:	e9 60 ff ff ff       	jmp    80483d0 <_init+0x24>

08048470 <putchar@plt>:
 8048470:	ff 25 24 a0 04 08    	jmp    *0x804a024
 8048476:	68 48 00 00 00       	push   $0x48
 804847b:	e9 50 ff ff ff       	jmp    80483d0 <_init+0x24>

Disassembly of section .text:

08048480 <_start>:
 8048480:	31 ed                	xor    %ebp,%ebp
 8048482:	5e                   	pop    %esi
 8048483:	89 e1                	mov    %esp,%ecx
 8048485:	83 e4 f0             	and    $0xfffffff0,%esp
 8048488:	50                   	push   %eax
 8048489:	54                   	push   %esp
 804848a:	52                   	push   %edx
 804848b:	68 00 87 04 08       	push   $0x8048700
 8048490:	68 90 86 04 08       	push   $0x8048690
 8048495:	51                   	push   %ecx
 8048496:	56                   	push   %esi
 8048497:	68 61 86 04 08       	push   $0x8048661
 804849c:	e8 af ff ff ff       	call   8048450 <__libc_start_main@plt>
 80484a1:	f4                   	hlt    
 80484a2:	90                   	nop
 80484a3:	90                   	nop
 80484a4:	90                   	nop
 80484a5:	90                   	nop
 80484a6:	90                   	nop
 80484a7:	90                   	nop
 80484a8:	90                   	nop
 80484a9:	90                   	nop
 80484aa:	90                   	nop
 80484ab:	90                   	nop
 80484ac:	90                   	nop
 80484ad:	90                   	nop
 80484ae:	90                   	nop
 80484af:	90                   	nop

080484b0 <deregister_tm_clones>:
 80484b0:	b8 33 a0 04 08       	mov    $0x804a033,%eax
 80484b5:	2d 30 a0 04 08       	sub    $0x804a030,%eax
 80484ba:	83 f8 06             	cmp    $0x6,%eax
 80484bd:	76 1a                	jbe    80484d9 <deregister_tm_clones+0x29>
 80484bf:	b8 00 00 00 00       	mov    $0x0,%eax
 80484c4:	85 c0                	test   %eax,%eax
 80484c6:	74 11                	je     80484d9 <deregister_tm_clones+0x29>
 80484c8:	55                   	push   %ebp
 80484c9:	89 e5                	mov    %esp,%ebp
 80484cb:	83 ec 14             	sub    $0x14,%esp
 80484ce:	68 30 a0 04 08       	push   $0x804a030
 80484d3:	ff d0                	call   *%eax
 80484d5:	83 c4 10             	add    $0x10,%esp
 80484d8:	c9                   	leave  
 80484d9:	f3 c3                	repz ret 
 80484db:	90                   	nop
 80484dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

080484e0 <register_tm_clones>:
 80484e0:	b8 30 a0 04 08       	mov    $0x804a030,%eax
 80484e5:	2d 30 a0 04 08       	sub    $0x804a030,%eax
 80484ea:	c1 f8 02             	sar    $0x2,%eax
 80484ed:	89 c2                	mov    %eax,%edx
 80484ef:	c1 ea 1f             	shr    $0x1f,%edx
 80484f2:	01 d0                	add    %edx,%eax
 80484f4:	d1 f8                	sar    %eax
 80484f6:	74 1b                	je     8048513 <register_tm_clones+0x33>
 80484f8:	ba 00 00 00 00       	mov    $0x0,%edx
 80484fd:	85 d2                	test   %edx,%edx
 80484ff:	74 12                	je     8048513 <register_tm_clones+0x33>
 8048501:	55                   	push   %ebp
 8048502:	89 e5                	mov    %esp,%ebp
 8048504:	83 ec 10             	sub    $0x10,%esp
 8048507:	50                   	push   %eax
 8048508:	68 30 a0 04 08       	push   $0x804a030
 804850d:	ff d2                	call   *%edx
 804850f:	83 c4 10             	add    $0x10,%esp
 8048512:	c9                   	leave  
 8048513:	f3 c3                	repz ret 
 8048515:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048520 <__do_global_dtors_aux>:
 8048520:	80 3d 30 a0 04 08 00 	cmpb   $0x0,0x804a030
 8048527:	75 13                	jne    804853c <__do_global_dtors_aux+0x1c>
 8048529:	55                   	push   %ebp
 804852a:	89 e5                	mov    %esp,%ebp
 804852c:	83 ec 08             	sub    $0x8,%esp
 804852f:	e8 7c ff ff ff       	call   80484b0 <deregister_tm_clones>
 8048534:	c6 05 30 a0 04 08 01 	movb   $0x1,0x804a030
 804853b:	c9                   	leave  
 804853c:	f3 c3                	repz ret 
 804853e:	66 90                	xchg   %ax,%ax

08048540 <frame_dummy>:
 8048540:	b8 04 9f 04 08       	mov    $0x8049f04,%eax
 8048545:	8b 10                	mov    (%eax),%edx
 8048547:	85 d2                	test   %edx,%edx
 8048549:	75 05                	jne    8048550 <frame_dummy+0x10>
 804854b:	eb 93                	jmp    80484e0 <register_tm_clones>
 804854d:	8d 76 00             	lea    0x0(%esi),%esi
 8048550:	ba 00 00 00 00       	mov    $0x0,%edx
 8048555:	85 d2                	test   %edx,%edx
 8048557:	74 f2                	je     804854b <frame_dummy+0xb>
 8048559:	55                   	push   %ebp
 804855a:	89 e5                	mov    %esp,%ebp
 804855c:	83 ec 14             	sub    $0x14,%esp
 804855f:	50                   	push   %eax
 8048560:	ff d2                	call   *%edx
 8048562:	83 c4 10             	add    $0x10,%esp
 8048565:	c9                   	leave  
 8048566:	e9 75 ff ff ff       	jmp    80484e0 <register_tm_clones>
 804856b:	90                   	nop

0804856c <read_flag>:
 804856c:	55                   	push   %ebp
 804856d:	89 e5                	mov    %esp,%ebp
 804856f:	81 ec 18 04 00 00    	sub    $0x418,%esp
 8048575:	83 ec 08             	sub    $0x8,%esp
 8048578:	68 28 87 04 08       	push   $0x8048728
 804857d:	68 2a 87 04 08       	push   $0x804872a
 8048582:	e8 d9 fe ff ff       	call   8048460 <fopen@plt>
 8048587:	83 c4 10             	add    $0x10,%esp
 804858a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804858d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048591:	75 0f                	jne    80485a2 <read_flag+0x36>
 8048593:	83 ec 08             	sub    $0x8,%esp
 8048596:	68 38 87 04 08       	push   $0x8048738
 804859b:	6a 01                	push   $0x1
 804859d:	e8 6e fe ff ff       	call   8048410 <err@plt>
 80485a2:	83 ec 0c             	sub    $0xc,%esp
 80485a5:	68 65 87 04 08       	push   $0x8048765
 80485aa:	e8 81 fe ff ff       	call   8048430 <puts@plt>
 80485af:	83 c4 10             	add    $0x10,%esp
 80485b2:	ff 75 f4             	pushl  -0xc(%ebp)
 80485b5:	68 ff 03 00 00       	push   $0x3ff
 80485ba:	6a 01                	push   $0x1
 80485bc:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
 80485c2:	50                   	push   %eax
 80485c3:	e8 58 fe ff ff       	call   8048420 <fread@plt>
 80485c8:	83 c4 10             	add    $0x10,%esp
 80485cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80485ce:	8d 95 f0 fb ff ff    	lea    -0x410(%ebp),%edx
 80485d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80485d7:	01 d0                	add    %edx,%eax
 80485d9:	c6 00 00             	movb   $0x0,(%eax)
 80485dc:	83 ec 08             	sub    $0x8,%esp
 80485df:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
 80485e5:	50                   	push   %eax
 80485e6:	68 79 87 04 08       	push   $0x8048779
 80485eb:	e8 f0 fd ff ff       	call   80483e0 <printf@plt>
 80485f0:	83 c4 10             	add    $0x10,%esp
 80485f3:	81 7d f0 fe 03 00 00 	cmpl   $0x3fe,-0x10(%ebp)
 80485fa:	77 02                	ja     80485fe <read_flag+0x92>
 80485fc:	eb 02                	jmp    8048600 <read_flag+0x94>
 80485fe:	eb b2                	jmp    80485b2 <read_flag+0x46>
 8048600:	83 ec 0c             	sub    $0xc,%esp
 8048603:	6a 0a                	push   $0xa
 8048605:	e8 66 fe ff ff       	call   8048470 <putchar@plt>
 804860a:	83 c4 10             	add    $0x10,%esp
 804860d:	83 ec 0c             	sub    $0xc,%esp
 8048610:	ff 75 f4             	pushl  -0xc(%ebp)
 8048613:	e8 e8 fd ff ff       	call   8048400 <fclose@plt>
 8048618:	83 c4 10             	add    $0x10,%esp
 804861b:	c9                   	leave  
 804861c:	c3                   	ret    

0804861d <jump_to_here>:
 804861d:	55                   	push   %ebp
 804861e:	89 e5                	mov    %esp,%ebp
 8048620:	83 ec 08             	sub    $0x8,%esp
 8048623:	e8 44 ff ff ff       	call   804856c <read_flag>
 8048628:	c9                   	leave  
 8048629:	c3                   	ret    

0804862a <start>:
 804862a:	55                   	push   %ebp
 804862b:	89 e5                	mov    %esp,%ebp
 804862d:	83 ec 48             	sub    $0x48,%esp
 8048630:	83 ec 08             	sub    $0x8,%esp
 8048633:	68 7c 87 04 08       	push   $0x804877c
 8048638:	68 7f 87 04 08       	push   $0x804877f
 804863d:	e8 1e fe ff ff       	call   8048460 <fopen@plt>
 8048642:	83 c4 10             	add    $0x10,%esp
 8048645:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048648:	83 ec 04             	sub    $0x4,%esp
 804864b:	ff 75 f4             	pushl  -0xc(%ebp)
 804864e:	68 00 02 00 00       	push   $0x200
 8048653:	8d 45 c2             	lea    -0x3e(%ebp),%eax
 8048656:	50                   	push   %eax
 8048657:	e8 94 fd ff ff       	call   80483f0 <fgets@plt>
 804865c:	83 c4 10             	add    $0x10,%esp
 804865f:	c9                   	leave  
 8048660:	c3                   	ret    

08048661 <main>:
 8048661:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 8048665:	83 e4 f0             	and    $0xfffffff0,%esp
 8048668:	ff 71 fc             	pushl  -0x4(%ecx)
 804866b:	55                   	push   %ebp
 804866c:	89 e5                	mov    %esp,%ebp
 804866e:	51                   	push   %ecx
 804866f:	83 ec 04             	sub    $0x4,%esp
 8048672:	e8 b3 ff ff ff       	call   804862a <start>
 8048677:	b8 00 00 00 00       	mov    $0x0,%eax
 804867c:	83 c4 04             	add    $0x4,%esp
 804867f:	59                   	pop    %ecx
 8048680:	5d                   	pop    %ebp
 8048681:	8d 61 fc             	lea    -0x4(%ecx),%esp
 8048684:	c3                   	ret    
 8048685:	90                   	nop
 8048686:	90                   	nop
 8048687:	90                   	nop
 8048688:	90                   	nop
 8048689:	90                   	nop
 804868a:	90                   	nop
 804868b:	90                   	nop
 804868c:	90                   	nop
 804868d:	90                   	nop
 804868e:	90                   	nop
 804868f:	90                   	nop

08048690 <__libc_csu_init>:
 8048690:	55                   	push   %ebp
 8048691:	57                   	push   %edi
 8048692:	56                   	push   %esi
 8048693:	53                   	push   %ebx
 8048694:	e8 69 00 00 00       	call   8048702 <__i686.get_pc_thunk.bx>
 8048699:	81 c3 5b 19 00 00    	add    $0x195b,%ebx
 804869f:	83 ec 1c             	sub    $0x1c,%esp
 80486a2:	8b 6c 24 30          	mov    0x30(%esp),%ebp
 80486a6:	8d bb 0c ff ff ff    	lea    -0xf4(%ebx),%edi
 80486ac:	e8 fb fc ff ff       	call   80483ac <_init>
 80486b1:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
 80486b7:	29 c7                	sub    %eax,%edi
 80486b9:	c1 ff 02             	sar    $0x2,%edi
 80486bc:	85 ff                	test   %edi,%edi
 80486be:	74 29                	je     80486e9 <__libc_csu_init+0x59>
 80486c0:	31 f6                	xor    %esi,%esi
 80486c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80486c8:	8b 44 24 38          	mov    0x38(%esp),%eax
 80486cc:	89 2c 24             	mov    %ebp,(%esp)
 80486cf:	89 44 24 08          	mov    %eax,0x8(%esp)
 80486d3:	8b 44 24 34          	mov    0x34(%esp),%eax
 80486d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 80486db:	ff 94 b3 08 ff ff ff 	call   *-0xf8(%ebx,%esi,4)
 80486e2:	83 c6 01             	add    $0x1,%esi
 80486e5:	39 fe                	cmp    %edi,%esi
 80486e7:	75 df                	jne    80486c8 <__libc_csu_init+0x38>
 80486e9:	83 c4 1c             	add    $0x1c,%esp
 80486ec:	5b                   	pop    %ebx
 80486ed:	5e                   	pop    %esi
 80486ee:	5f                   	pop    %edi
 80486ef:	5d                   	pop    %ebp
 80486f0:	c3                   	ret    
 80486f1:	eb 0d                	jmp    8048700 <__libc_csu_fini>
 80486f3:	90                   	nop
 80486f4:	90                   	nop
 80486f5:	90                   	nop
 80486f6:	90                   	nop
 80486f7:	90                   	nop
 80486f8:	90                   	nop
 80486f9:	90                   	nop
 80486fa:	90                   	nop
 80486fb:	90                   	nop
 80486fc:	90                   	nop
 80486fd:	90                   	nop
 80486fe:	90                   	nop
 80486ff:	90                   	nop

08048700 <__libc_csu_fini>:
 8048700:	f3 c3                	repz ret 

08048702 <__i686.get_pc_thunk.bx>:
 8048702:	8b 1c 24             	mov    (%esp),%ebx
 8048705:	c3                   	ret    
 8048706:	90                   	nop
 8048707:	90                   	nop

Disassembly of section .fini:

08048708 <_fini>:
 8048708:	53                   	push   %ebx
 8048709:	83 ec 08             	sub    $0x8,%esp
 804870c:	e8 00 00 00 00       	call   8048711 <_fini+0x9>
 8048711:	5b                   	pop    %ebx
 8048712:	81 c3 e3 18 00 00    	add    $0x18e3,%ebx
 8048718:	83 c4 08             	add    $0x8,%esp
 804871b:	5b                   	pop    %ebx
 804871c:	c3                   	ret    
