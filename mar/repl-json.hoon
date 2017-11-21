::
::::  /hoon/repl-json/mar
  ::
/?    310
  ::
::::  compute
  ::
|_  jon/json
::
++  grow                                                ::  convert to
  |%
  ++  mime  :-                                          ::  convert to %mime
    /text/json
    (as-octt:mimes:html (en-json:html jon))             
  --
++  grab
  |%                                                    ::  convert from
  ++  noun  json                                        ::  clam from %noun
  --
--
