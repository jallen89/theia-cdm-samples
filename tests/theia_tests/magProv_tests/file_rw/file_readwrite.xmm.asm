
file_readwrite.xmm:     file format elf32-i386


Disassembly of section .init:

08048358 <_init>:
 8048358:	53                   	push   %ebx
 8048359:	83 ec 08             	sub    $0x8,%esp
 804835c:	e8 00 00 00 00       	call   8048361 <_init+0x9>
 8048361:	5b                   	pop    %ebx
 8048362:	81 c3 93 1c 00 00    	add    $0x1c93,%ebx
 8048368:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 804836e:	85 c0                	test   %eax,%eax
 8048370:	74 05                	je     8048377 <_init+0x1f>
 8048372:	e8 39 00 00 00       	call   80483b0 <__gmon_start__@plt>
 8048377:	83 c4 08             	add    $0x8,%esp
 804837a:	5b                   	pop    %ebx
 804837b:	c3                   	ret    

Disassembly of section .plt:

08048380 <read@plt-0x10>:
 8048380:	ff 35 f8 9f 04 08    	pushl  0x8049ff8
 8048386:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 804838c:	00 00                	add    %al,(%eax)
	...

08048390 <read@plt>:
 8048390:	ff 25 00 a0 04 08    	jmp    *0x804a000
 8048396:	68 00 00 00 00       	push   $0x0
 804839b:	e9 e0 ff ff ff       	jmp    8048380 <_init+0x28>

080483a0 <__stack_chk_fail@plt>:
 80483a0:	ff 25 04 a0 04 08    	jmp    *0x804a004
 80483a6:	68 08 00 00 00       	push   $0x8
 80483ab:	e9 d0 ff ff ff       	jmp    8048380 <_init+0x28>

080483b0 <__gmon_start__@plt>:
 80483b0:	ff 25 08 a0 04 08    	jmp    *0x804a008
 80483b6:	68 10 00 00 00       	push   $0x10
 80483bb:	e9 c0 ff ff ff       	jmp    8048380 <_init+0x28>

080483c0 <open@plt>:
 80483c0:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 80483c6:	68 18 00 00 00       	push   $0x18
 80483cb:	e9 b0 ff ff ff       	jmp    8048380 <_init+0x28>

080483d0 <__libc_start_main@plt>:
 80483d0:	ff 25 10 a0 04 08    	jmp    *0x804a010
 80483d6:	68 20 00 00 00       	push   $0x20
 80483db:	e9 a0 ff ff ff       	jmp    8048380 <_init+0x28>

080483e0 <write@plt>:
 80483e0:	ff 25 14 a0 04 08    	jmp    *0x804a014
 80483e6:	68 28 00 00 00       	push   $0x28
 80483eb:	e9 90 ff ff ff       	jmp    8048380 <_init+0x28>

080483f0 <strncpy@plt>:
 80483f0:	ff 25 18 a0 04 08    	jmp    *0x804a018
 80483f6:	68 30 00 00 00       	push   $0x30
 80483fb:	e9 80 ff ff ff       	jmp    8048380 <_init+0x28>

Disassembly of section .text:

08048400 <_start>:
 8048400:	31 ed                	xor    %ebp,%ebp
 8048402:	5e                   	pop    %esi
 8048403:	89 e1                	mov    %esp,%ecx
 8048405:	83 e4 f0             	and    $0xfffffff0,%esp
 8048408:	50                   	push   %eax
 8048409:	54                   	push   %esp
 804840a:	52                   	push   %edx
 804840b:	68 20 87 04 08       	push   $0x8048720
 8048410:	68 b0 86 04 08       	push   $0x80486b0
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
 80484fa:	83 ec 64             	sub    $0x64,%esp
 80484fd:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
 8048503:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048506:	31 c0                	xor    %eax,%eax
 8048508:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
 804850f:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
 8048516:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%ebp)
 804851d:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
 8048524:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
 804852b:	c7 45 ac 00 00 00 00 	movl   $0x0,-0x54(%ebp)
 8048532:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
 8048539:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
 8048540:	83 ec 08             	sub    $0x8,%esp
 8048543:	6a 02                	push   $0x2
 8048545:	68 48 87 04 08       	push   $0x8048748
 804854a:	e8 71 fe ff ff       	call   80483c0 <open@plt>
 804854f:	83 c4 10             	add    $0x10,%esp
 8048552:	89 45 a0             	mov    %eax,-0x60(%ebp)
 8048555:	83 ec 08             	sub    $0x8,%esp
 8048558:	6a 02                	push   $0x2
 804855a:	68 7c 87 04 08       	push   $0x804877c
 804855f:	e8 5c fe ff ff       	call   80483c0 <open@plt>
 8048564:	83 c4 10             	add    $0x10,%esp
 8048567:	89 45 a4             	mov    %eax,-0x5c(%ebp)
 804856a:	83 ec 08             	sub    $0x8,%esp
 804856d:	6a 02                	push   $0x2
 804856f:	68 b0 87 04 08       	push   $0x80487b0
 8048574:	e8 47 fe ff ff       	call   80483c0 <open@plt>
 8048579:	83 c4 10             	add    $0x10,%esp
 804857c:	89 45 a8             	mov    %eax,-0x58(%ebp)
 804857f:	83 ec 08             	sub    $0x8,%esp
 8048582:	6a 02                	push   $0x2
 8048584:	68 e4 87 04 08       	push   $0x80487e4
 8048589:	e8 32 fe ff ff       	call   80483c0 <open@plt>
 804858e:	83 c4 10             	add    $0x10,%esp
 8048591:	89 45 ac             	mov    %eax,-0x54(%ebp)
 8048594:	83 ec 08             	sub    $0x8,%esp
 8048597:	6a 02                	push   $0x2
 8048599:	68 18 88 04 08       	push   $0x8048818
 804859e:	e8 1d fe ff ff       	call   80483c0 <open@plt>
 80485a3:	83 c4 10             	add    $0x10,%esp
 80485a6:	89 45 b0             	mov    %eax,-0x50(%ebp)
 80485a9:	83 ec 08             	sub    $0x8,%esp
 80485ac:	6a 02                	push   $0x2
 80485ae:	68 4c 88 04 08       	push   $0x804884c
 80485b3:	e8 08 fe ff ff       	call   80483c0 <open@plt>
 80485b8:	83 c4 10             	add    $0x10,%esp
 80485bb:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 80485be:	83 ec 04             	sub    $0x4,%esp
 80485c1:	6a 0a                	push   $0xa
 80485c3:	8d 45 b8             	lea    -0x48(%ebp),%eax
 80485c6:	50                   	push   %eax
 80485c7:	ff 75 a0             	pushl  -0x60(%ebp)
 80485ca:	e8 c1 fd ff ff       	call   8048390 <read@plt>
 80485cf:	83 c4 10             	add    $0x10,%esp
 80485d2:	89 45 98             	mov    %eax,-0x68(%ebp)
 80485d5:	83 ec 04             	sub    $0x4,%esp
 80485d8:	6a 0a                	push   $0xa
 80485da:	8d 45 c2             	lea    -0x3e(%ebp),%eax
 80485dd:	50                   	push   %eax
 80485de:	ff 75 a4             	pushl  -0x5c(%ebp)
 80485e1:	e8 aa fd ff ff       	call   8048390 <read@plt>
 80485e6:	83 c4 10             	add    $0x10,%esp
 80485e9:	89 45 98             	mov    %eax,-0x68(%ebp)
 80485ec:	83 ec 04             	sub    $0x4,%esp
 80485ef:	6a 0a                	push   $0xa
 80485f1:	8d 45 cc             	lea    -0x34(%ebp),%eax
 80485f4:	50                   	push   %eax
 80485f5:	ff 75 a8             	pushl  -0x58(%ebp)
 80485f8:	e8 93 fd ff ff       	call   8048390 <read@plt>
 80485fd:	83 c4 10             	add    $0x10,%esp
 8048600:	89 45 98             	mov    %eax,-0x68(%ebp)
 8048603:	83 ec 04             	sub    $0x4,%esp
 8048606:	6a 0a                	push   $0xa
 8048608:	8d 45 c2             	lea    -0x3e(%ebp),%eax
 804860b:	50                   	push   %eax
 804860c:	8d 45 d6             	lea    -0x2a(%ebp),%eax
 804860f:	50                   	push   %eax
 8048610:	e8 db fd ff ff       	call   80483f0 <strncpy@plt>
 8048615:	83 c4 10             	add    $0x10,%esp
 8048618:	83 ec 04             	sub    $0x4,%esp
 804861b:	6a 0a                	push   $0xa
 804861d:	8d 45 cc             	lea    -0x34(%ebp),%eax
 8048620:	50                   	push   %eax
 8048621:	8d 45 e0             	lea    -0x20(%ebp),%eax
 8048624:	50                   	push   %eax
 8048625:	e8 c6 fd ff ff       	call   80483f0 <strncpy@plt>
 804862a:	83 c4 10             	add    $0x10,%esp
 804862d:	83 ec 04             	sub    $0x4,%esp
 8048630:	6a 0a                	push   $0xa
 8048632:	8d 45 b8             	lea    -0x48(%ebp),%eax
 8048635:	50                   	push   %eax
 8048636:	8d 45 ea             	lea    -0x16(%ebp),%eax
 8048639:	50                   	push   %eax
 804863a:	e8 b1 fd ff ff       	call   80483f0 <strncpy@plt>
 804863f:	83 c4 10             	add    $0x10,%esp
 8048642:	83 ec 04             	sub    $0x4,%esp
 8048645:	6a 0a                	push   $0xa
 8048647:	8d 45 d6             	lea    -0x2a(%ebp),%eax
 804864a:	50                   	push   %eax
 804864b:	ff 75 ac             	pushl  -0x54(%ebp)
 804864e:	e8 8d fd ff ff       	call   80483e0 <write@plt>
 8048653:	83 c4 10             	add    $0x10,%esp
 8048656:	89 45 9c             	mov    %eax,-0x64(%ebp)
 8048659:	83 ec 04             	sub    $0x4,%esp
 804865c:	6a 0a                	push   $0xa
 804865e:	8d 45 e0             	lea    -0x20(%ebp),%eax
 8048661:	50                   	push   %eax
 8048662:	ff 75 b0             	pushl  -0x50(%ebp)
 8048665:	e8 76 fd ff ff       	call   80483e0 <write@plt>
 804866a:	83 c4 10             	add    $0x10,%esp
 804866d:	89 45 9c             	mov    %eax,-0x64(%ebp)
 8048670:	83 ec 04             	sub    $0x4,%esp
 8048673:	6a 0a                	push   $0xa
 8048675:	8d 45 ea             	lea    -0x16(%ebp),%eax
 8048678:	50                   	push   %eax
 8048679:	ff 75 b4             	pushl  -0x4c(%ebp)
 804867c:	e8 5f fd ff ff       	call   80483e0 <write@plt>
 8048681:	83 c4 10             	add    $0x10,%esp
 8048684:	89 45 9c             	mov    %eax,-0x64(%ebp)
 8048687:	b8 00 00 00 00       	mov    $0x0,%eax
 804868c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804868f:	65 33 15 14 00 00 00 	xor    %gs:0x14,%edx
 8048696:	74 05                	je     804869d <main+0x1b1>
 8048698:	e8 03 fd ff ff       	call   80483a0 <__stack_chk_fail@plt>
 804869d:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 80486a0:	c9                   	leave  
 80486a1:	8d 61 fc             	lea    -0x4(%ecx),%esp
 80486a4:	c3                   	ret    
 80486a5:	90                   	nop
 80486a6:	90                   	nop
 80486a7:	90                   	nop
 80486a8:	90                   	nop
 80486a9:	90                   	nop
 80486aa:	90                   	nop
 80486ab:	90                   	nop
 80486ac:	90                   	nop
 80486ad:	90                   	nop
 80486ae:	90                   	nop
 80486af:	90                   	nop

080486b0 <__libc_csu_init>:
 80486b0:	55                   	push   %ebp
 80486b1:	57                   	push   %edi
 80486b2:	56                   	push   %esi
 80486b3:	53                   	push   %ebx
 80486b4:	e8 69 00 00 00       	call   8048722 <__i686.get_pc_thunk.bx>
 80486b9:	81 c3 3b 19 00 00    	add    $0x193b,%ebx
 80486bf:	83 ec 1c             	sub    $0x1c,%esp
 80486c2:	8b 6c 24 30          	mov    0x30(%esp),%ebp
 80486c6:	8d bb 0c ff ff ff    	lea    -0xf4(%ebx),%edi
 80486cc:	e8 87 fc ff ff       	call   8048358 <_init>
 80486d1:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
 80486d7:	29 c7                	sub    %eax,%edi
 80486d9:	c1 ff 02             	sar    $0x2,%edi
 80486dc:	85 ff                	test   %edi,%edi
 80486de:	74 29                	je     8048709 <__libc_csu_init+0x59>
 80486e0:	31 f6                	xor    %esi,%esi
 80486e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80486e8:	8b 44 24 38          	mov    0x38(%esp),%eax
 80486ec:	89 2c 24             	mov    %ebp,(%esp)
 80486ef:	89 44 24 08          	mov    %eax,0x8(%esp)
 80486f3:	8b 44 24 34          	mov    0x34(%esp),%eax
 80486f7:	89 44 24 04          	mov    %eax,0x4(%esp)
 80486fb:	ff 94 b3 08 ff ff ff 	call   *-0xf8(%ebx,%esi,4)
 8048702:	83 c6 01             	add    $0x1,%esi
 8048705:	39 fe                	cmp    %edi,%esi
 8048707:	75 df                	jne    80486e8 <__libc_csu_init+0x38>
 8048709:	83 c4 1c             	add    $0x1c,%esp
 804870c:	5b                   	pop    %ebx
 804870d:	5e                   	pop    %esi
 804870e:	5f                   	pop    %edi
 804870f:	5d                   	pop    %ebp
 8048710:	c3                   	ret    
 8048711:	eb 0d                	jmp    8048720 <__libc_csu_fini>
 8048713:	90                   	nop
 8048714:	90                   	nop
 8048715:	90                   	nop
 8048716:	90                   	nop
 8048717:	90                   	nop
 8048718:	90                   	nop
 8048719:	90                   	nop
 804871a:	90                   	nop
 804871b:	90                   	nop
 804871c:	90                   	nop
 804871d:	90                   	nop
 804871e:	90                   	nop
 804871f:	90                   	nop

08048720 <__libc_csu_fini>:
 8048720:	f3 c3                	repz ret 

08048722 <__i686.get_pc_thunk.bx>:
 8048722:	8b 1c 24             	mov    (%esp),%ebx
 8048725:	c3                   	ret    
 8048726:	90                   	nop
 8048727:	90                   	nop

Disassembly of section .fini:

08048728 <_fini>:
 8048728:	53                   	push   %ebx
 8048729:	83 ec 08             	sub    $0x8,%esp
 804872c:	e8 00 00 00 00       	call   8048731 <_fini+0x9>
 8048731:	5b                   	pop    %ebx
 8048732:	81 c3 c3 18 00 00    	add    $0x18c3,%ebx
 8048738:	83 c4 08             	add    $0x8,%esp
 804873b:	5b                   	pop    %ebx
 804873c:	c3                   	ret    
