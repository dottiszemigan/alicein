xquery version "3.1";
declare namespace tei="http://www.tei-c.org/ns/1.0"; 

let $names := (doc("AliceInWonderland.xml")//tei:text//tei:div1//tei:name)
for $pers in distinct-values(data($names/@ref))
let $items := $names[@ref= $pers]
return <character name="{$pers}" count="{count($items)}" />
