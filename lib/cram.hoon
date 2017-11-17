|%
++  static                                              :: freeze .mdh hoon subset
  |=  gen/twig  ^-  {inf/(map term dime) elm/manx}
  ?+    -.gen
      =/  gen  ~(open ap gen)
      ?:  =(gen ^gen)  ~|([%cram-dynamic -.gen] !!)
      $(gen gen)
  ::
    $xray  [~ (single (shut gen))]
    ^     [(malt (frontmatter p.gen)) (single (shut q.gen))]
  ==
::
++  single                                              :: unwrap one-elem marl
  |=  xml/marl  ^-  manx
  ?:  ?=({* $~} xml)  i.xml
  ~|(%many-elems !!)
::
++  shut-mart                                           :: xml attrs
  |=({n/mane v/(list beer:twig)} [n (turn v |=(a/beer:twig ?^(a !! a)))])
::
++  shut                                                :: as xml constant
  |=  gen/twig  ^-  marl
  ?+    -.gen  ~|([%bad-xml -.gen] !!)
      $dbug  $(gen q.gen)
  ::
      $xray
    [[n.g.p.gen (turn a.g.p.gen shut-mart)] $(gen [%smts c.p.gen])]~
  ::
      $smts
    ?~  p.gen  ~
    =-  (weld - $(p.gen t.p.gen))
    ?^  -.i.p.gen  $(gen [%xray i.p.gen])
    ~|  [%shut-tuna -.i.p.gen]
    ?+  -.i.p.gen  !!
      $manx  ?>(?=($xray -.p.i.p.gen) $(gen p.i.p.gen))
      $marl  ?>(?=($smts -.p.i.p.gen) $(gen p.i.p.gen))
    ==
  ==
::
::
++  frontmatter                                         :: parse ~[[%foo 1] [%bar ~s2]]
  |=  gen/twig  ^-  (list {term dime})
  ?:  ?=({$bust $null} gen)  ~
  ?:  ?=($dbug -.gen)  $(gen q.gen)
  ?.  ?=($clsg -.gen)  ~|([%bad-frontmatter -.gen] !!)
  %+  turn  p.gen
  |=  gen/twig
  ?.  ?=(^ -.gen)
    =/  gen  ~(open ap gen)
    ?:  =(gen ^gen)  ~|([%bad-frontmatter-elem -.gen] !!)
    $(gen gen)
  =/  hed  (as-dime p.gen)
  ?.  =(%tas p.hed)  ~|([%bad-frontmatter-key-type p.hed] !!)
  [q.hed (as-dime q.gen)]
::
++  as-dime                                            :: %foo ~.foo 0vbar etc
  |=  gen/twig  ^-  dime
  ?:  ?=($dbug -.gen)  $(gen q.gen)
  ?.  ?=({?($rock $sand) @ @} gen)  ~|([%bad-literal gen] !!)
  +.gen
--
