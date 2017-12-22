
test:     file format elf32-i386


Disassembly of section .init:

08048354 <_init>:
 8048354:	53                   	push   %ebx
 8048355:	83 ec 08             	sub    $0x8,%esp
 8048358:	e8 00 00 00 00       	call   804835d <_init+0x9>
 804835d:	5b                   	pop    %ebx
 804835e:	81 c3 97 1c 00 00    	add    $0x1c97,%ebx
 8048364:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 804836a:	85 c0                	test   %eax,%eax
 804836c:	74 05                	je     8048373 <_init+0x1f>
 804836e:	e8 3d 00 00 00       	call   80483b0 <__gmon_start__@plt>
 8048373:	83 c4 08             	add    $0x8,%esp
 8048376:	5b                   	pop    %ebx
 8048377:	c3                   	ret    

Disassembly of section .plt:

08048380 <read@plt-0x10>:
 8048380:	ff 35 f8 9f 04 08    	pushl  0x8049ff8
 8048386:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 804838c:	00 00                	add    %al,(%eax)
	...

08048390 <read@plt>:
 8048390:	ff 25 00 a0 04 08    	jmp    *0x804a000
 8048396:	68 00 00 00 00       	push   $0x0
 804839b:	e9 e0 ff ff ff       	jmp    8048380 <_init+0x2c>

080483a0 <__stack_chk_fail@plt>:
 80483a0:	ff 25 04 a0 04 08    	jmp    *0x804a004
 80483a6:	68 08 00 00 00       	push   $0x8
 80483ab:	e9 d0 ff ff ff       	jmp    8048380 <_init+0x2c>

080483b0 <__gmon_start__@plt>:
 80483b0:	ff 25 08 a0 04 08    	jmp    *0x804a008
 80483b6:	68 10 00 00 00       	push   $0x10
 80483bb:	e9 c0 ff ff ff       	jmp    8048380 <_init+0x2c>

080483c0 <open@plt>:
 80483c0:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 80483c6:	68 18 00 00 00       	push   $0x18
 80483cb:	e9 b0 ff ff ff       	jmp    8048380 <_init+0x2c>

080483d0 <__libc_start_main@plt>:
 80483d0:	ff 25 10 a0 04 08    	jmp    *0x804a010
 80483d6:	68 20 00 00 00       	push   $0x20
 80483db:	e9 a0 ff ff ff       	jmp    8048380 <_init+0x2c>

080483e0 <write@plt>:
 80483e0:	ff 25 14 a0 04 08    	jmp    *0x804a014
 80483e6:	68 28 00 00 00       	push   $0x28
 80483eb:	e9 90 ff ff ff       	jmp    8048380 <_init+0x2c>

080483f0 <close@plt>:
 80483f0:	ff 25 18 a0 04 08    	jmp    *0x804a018
 80483f6:	68 30 00 00 00       	push   $0x30
 80483fb:	e9 80 ff ff ff       	jmp    8048380 <_init+0x2c>

Disassembly of section .text:

08048400 <_start>:
 8048400:	31 ed                	xor    %ebp,%ebp
 8048402:	5e                   	pop    %esi
 8048403:	89 e1                	mov    %esp,%ecx
 8048405:	83 e4 f0             	and    $0xfffffff0,%esp
 8048408:	50                   	push   %eax
 8048409:	54                   	push   %esp
 804840a:	52                   	push   %edx
 804840b:	68 50 86 04 08       	push   $0x8048650
 8048410:	68 e0 85 04 08       	push   $0x80485e0
 8048415:	51                   	push   %ecx
 8048416:	56                   	push   %esi
 8048417:	68 ec 84 04 08       	push   $0x80484ec
 804841c:	e8 af ff ff ff       	call   80483d0 <__libc_start_main@plt>
 8048421:	f4                   	hlt    
 8048422:	90                   	nop
 8048423:	90                   	nop
 8048424:	90                   	nop
 8048425:	90                   	nop
 8048426:	90                   	nop
 8048427:	90                   	nop
 8048428:	90                   	nop
 8048429:	90                   	nop
 804842a:	90                   	nop
 804842b:	90                   	nop
 804842c:	90                   	nop
 804842d:	90                   	nop
 804842e:	90                   	nop
 804842f:	90                   	nop

08048430 <deregister_tm_clones>:
 8048430:	b8 27 a0 04 08       	mov    $0x804a027,%eax
 8048435:	2d 24 a0 04 08       	sub    $0x804a024,%eax
 804843a:	83 f8 06             	cmp    $0x6,%eax
 804843d:	76 1a                	jbe    8048459 <deregister_tm_clones+0x29>
 804843f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048444:	85 c0                	test   %eax,%eax
 8048446:	74 11                	je     8048459 <deregister_tm_clones+0x29>
 8048448:	55                   	push   %ebp
 8048449:	89 e5                	mov    %esp,%ebp
 804844b:	83 ec 14             	sub    $0x14,%esp
 804844e:	68 24 a0 04 08       	push   $0x804a024
 8048453:	ff d0                	call   *%eax
 8048455:	83 c4 10             	add    $0x10,%esp
 8048458:	c9                   	leave  
 8048459:	f3 c3                	repz ret 
 804845b:	90                   	nop
 804845c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

08048460 <register_tm_clones>:
 8048460:	b8 24 a0 04 08       	mov    $0x804a024,%eax
 8048465:	2d 24 a0 04 08       	sub    $0x804a024,%eax
 804846a:	c1 f8 02             	sar    $0x2,%eax
 804846d:	89 c2                	mov    %eax,%edx
 804846f:	c1 ea 1f             	shr    $0x1f,%edx
 8048472:	01 d0                	add    %edx,%eax
 8048474:	d1 f8                	sar    %eax
 8048476:	74 1b                	je     8048493 <register_tm_clones+0x33>
 8048478:	ba 00 00 00 00       	mov    $0x0,%edx
 804847d:	85 d2                	test   %edx,%edx
 804847f:	74 12                	je     8048493 <register_tm_clones+0x33>
 8048481:	55                   	push   %ebp
 8048482:	89 e5                	mov    %esp,%ebp
 8048484:	83 ec 10             	sub    $0x10,%esp
 8048487:	50                   	push   %eax
 8048488:	68 24 a0 04 08       	push   $0x804a024
 804848d:	ff d2                	call   *%edx
 804848f:	83 c4 10             	add    $0x10,%esp
 8048492:	c9                   	leave  
 8048493:	f3 c3                	repz ret 
 8048495:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080484a0 <__do_global_dtors_aux>:
 80484a0:	80 3d 24 a0 04 08 00 	cmpb   $0x0,0x804a024
 80484a7:	75 13                	jne    80484bc <__do_global_dtors_aux+0x1c>
 80484a9:	55                   	push   %ebp
 80484aa:	89 e5                	mov    %esp,%ebp
 80484ac:	83 ec 08             	sub    $0x8,%esp
 80484af:	e8 7c ff ff ff       	call   8048430 <deregister_tm_clones>
 80484b4:	c6 05 24 a0 04 08 01 	movb   $0x1,0x804a024
 80484bb:	c9                   	leave  
 80484bc:	f3 c3                	repz ret 
 80484be:	66 90                	xchg   %ax,%ax

080484c0 <frame_dummy>:
 80484c0:	b8 04 9f 04 08       	mov    $0x8049f04,%eax
 80484c5:	8b 10                	mov    (%eax),%edx
 80484c7:	85 d2                	test   %edx,%edx
 80484c9:	75 05                	jne    80484d0 <frame_dummy+0x10>
 80484cb:	eb 93                	jmp    8048460 <register_tm_clones>
 80484cd:	8d 76 00             	lea    0x0(%esi),%esi
 80484d0:	ba 00 00 00 00       	mov    $0x0,%edx
 80484d5:	85 d2                	test   %edx,%edx
 80484d7:	74 f2                	je     80484cb <frame_dummy+0xb>
 80484d9:	55                   	push   %ebp
 80484da:	89 e5                	mov    %esp,%ebp
 80484dc:	83 ec 14             	sub    $0x14,%esp
 80484df:	50                   	push   %eax
 80484e0:	ff d2                	call   *%edx
 80484e2:	83 c4 10             	add    $0x10,%esp
 80484e5:	c9                   	leave  
 80484e6:	e9 75 ff ff ff       	jmp    8048460 <register_tm_clones>
 80484eb:	90                   	nop

080484ec <main>:
 80484ec:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 80484f0:	83 e4 f0             	and    $0xfffffff0,%esp
 80484f3:	ff 71 fc             	pushl  -0x4(%ecx)
 80484f6:	55                   	push   %ebp
 80484f7:	89 e5                	mov    %esp,%ebp
 80484f9:	51                   	push   %ecx
 80484fa:	83 ec 24             	sub    $0x24,%esp
 80484fd:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
 8048503:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048506:	31 c0                	xor    %eax,%eax
 8048508:	c6 45 ee 61          	movb   $0x61,-0x12(%ebp)
 804850c:	c6 45 ef 62          	movb   $0x62,-0x11(%ebp)
 8048510:	c6 45 f0 63          	movb   $0x63,-0x10(%ebp)
 8048514:	c6 45 f1 64          	movb   $0x64,-0xf(%ebp)
 8048518:	c6 45 f2 65          	movb   $0x65,-0xe(%ebp)
 804851c:	c6 45 f3 66          	movb   $0x66,-0xd(%ebp)
 8048520:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 8048527:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 804852e:	83 ec 08             	sub    $0x8,%esp
 8048531:	6a 02                	push   $0x2
 8048533:	68 78 86 04 08       	push   $0x8048678
 8048538:	e8 83 fe ff ff       	call   80483c0 <open@plt>
 804853d:	83 c4 10             	add    $0x10,%esp
 8048540:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8048543:	83 ec 04             	sub    $0x4,%esp
 8048546:	68 b4 01 00 00       	push   $0x1b4
 804854b:	6a 42                	push   $0x42
 804854d:	68 a0 86 04 08       	push   $0x80486a0
 8048552:	e8 69 fe ff ff       	call   80483c0 <open@plt>
 8048557:	83 c4 10             	add    $0x10,%esp
 804855a:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804855d:	83 ec 04             	sub    $0x4,%esp
 8048560:	6a 01                	push   $0x1
 8048562:	8d 45 da             	lea    -0x26(%ebp),%eax
 8048565:	50                   	push   %eax
 8048566:	ff 75 e4             	pushl  -0x1c(%ebp)
 8048569:	e8 22 fe ff ff       	call   8048390 <read@plt>
 804856e:	83 c4 10             	add    $0x10,%esp
 8048571:	89 45 dc             	mov    %eax,-0x24(%ebp)
 8048574:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
 8048578:	0f be c0             	movsbl %al,%eax
 804857b:	83 e8 30             	sub    $0x30,%eax
 804857e:	0f b6 44 05 ee       	movzbl -0x12(%ebp,%eax,1),%eax
 8048583:	88 45 db             	mov    %al,-0x25(%ebp)
 8048586:	83 ec 04             	sub    $0x4,%esp
 8048589:	6a 01                	push   $0x1
 804858b:	8d 45 db             	lea    -0x25(%ebp),%eax
 804858e:	50                   	push   %eax
 804858f:	ff 75 e8             	pushl  -0x18(%ebp)
 8048592:	e8 49 fe ff ff       	call   80483e0 <write@plt>
 8048597:	83 c4 10             	add    $0x10,%esp
 804859a:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804859d:	83 ec 0c             	sub    $0xc,%esp
 80485a0:	ff 75 e4             	pushl  -0x1c(%ebp)
 80485a3:	e8 48 fe ff ff       	call   80483f0 <close@plt>
 80485a8:	83 c4 10             	add    $0x10,%esp
 80485ab:	83 ec 0c             	sub    $0xc,%esp
 80485ae:	ff 75 e8             	pushl  -0x18(%ebp)
 80485b1:	e8 3a fe ff ff       	call   80483f0 <close@plt>
 80485b6:	83 c4 10             	add    $0x10,%esp
 80485b9:	b8 00 00 00 00       	mov    $0x0,%eax
 80485be:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80485c1:	65 33 15 14 00 00 00 	xor    %gs:0x14,%edx
 80485c8:	74 05                	je     80485cf <main+0xe3>
 80485ca:	e8 d1 fd ff ff       	call   80483a0 <__stack_chk_fail@plt>
 80485cf:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 80485d2:	c9                   	leave  
 80485d3:	8d 61 fc             	lea    -0x4(%ecx),%esp
 80485d6:	c3                   	ret    
 80485d7:	90                   	nop
 80485d8:	90                   	nop
 80485d9:	90                   	nop
 80485da:	90                   	nop
 80485db:	90                   	nop
 80485dc:	90                   	nop
 80485dd:	90                   	nop
 80485de:	90                   	nop
 80485df:	90                   	nop

080485e0 <__libc_csu_init>:
 80485e0:	55                   	push   %ebp
 80485e1:	57                   	push   %edi
 80485e2:	56                   	push   %esi
 80485e3:	53                   	push   %ebx
 80485e4:	e8 69 00 00 00       	call   8048652 <__i686.get_pc_thunk.bx>
 80485e9:	81 c3 0b 1a 00 00    	add    $0x1a0b,%ebx
 80485ef:	83 ec 1c             	sub    $0x1c,%esp
 80485f2:	8b 6c 24 30          	mov    0x30(%esp),%ebp
 80485f6:	8d bb 0c ff ff ff    	lea    -0xf4(%ebx),%edi
 80485fc:	e8 53 fd ff ff       	call   8048354 <_init>
 8048601:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
 8048607:	29 c7                	sub    %eax,%edi
 8048609:	c1 ff 02             	sar    $0x2,%edi
 804860c:	85 ff                	test   %edi,%edi
 804860e:	74 29                	je     8048639 <__libc_csu_init+0x59>
 8048610:	31 f6                	xor    %esi,%esi
 8048612:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048618:	8b 44 24 38          	mov    0x38(%esp),%eax
 804861c:	89 2c 24             	mov    %ebp,(%esp)
 804861f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048623:	8b 44 24 34          	mov    0x34(%esp),%eax
 8048627:	89 44 24 04          	mov    %eax,0x4(%esp)
 804862b:	ff 94 b3 08 ff ff ff 	call   *-0xf8(%ebx,%esi,4)
 8048632:	83 c6 01             	add    $0x1,%esi
 8048635:	39 fe                	cmp    %edi,%esi
 8048637:	75 df                	jne    8048618 <__libc_csu_init+0x38>
 8048639:	83 c4 1c             	add    $0x1c,%esp
 804863c:	5b                   	pop    %ebx
 804863d:	5e                   	pop    %esi
 804863e:	5f                   	pop    %edi
 804863f:	5d                   	pop    %ebp
 8048640:	c3                   	ret    
 8048641:	eb 0d                	jmp    8048650 <__libc_csu_fini>
 8048643:	90                   	nop
 8048644:	90                   	nop
 8048645:	90                   	nop
 8048646:	90                   	nop
 8048647:	90                   	nop
 8048648:	90                   	nop
 8048649:	90                   	nop
 804864a:	90                   	nop
 804864b:	90                   	nop
 804864c:	90                   	nop
 804864d:	90                   	nop
 804864e:	90                   	nop
 804864f:	90                   	nop

08048650 <__libc_csu_fini>:
 8048650:	f3 c3                	repz ret 

08048652 <__i686.get_pc_thunk.bx>:
 8048652:	8b 1c 24             	mov    (%esp),%ebx
 8048655:	c3                   	ret    
 8048656:	90                   	nop
 8048657:	90                   	nop

Disassembly of section .fini:

08048658 <_fini>:
 8048658:	53                   	push   %ebx
 8048659:	83 ec 08             	sub    $0x8,%esp
 804865c:	e8 00 00 00 00       	call   8048661 <_fini+0x9>
 8048661:	5b                   	pop    %ebx
 8048662:	81 c3 93 19 00 00    	add    $0x1993,%ebx
 8048668:	83 c4 08             	add    $0x8,%esp
 804866b:	5b                   	pop    %ebx
 804866c:	c3                   	ret    
