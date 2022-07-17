xquery version "3.1";
declare namespace tei="http://www.tei-c.org/ns/1.0"; 

<counts>
<text>
{
let $doc := (doc("AliceInWonderland.xml")//tei:text)
return string-length(string-join($doc//text()))
}
</text>

<quote>
{
let $doc := (doc("AliceInWonderland.xml")//tei:text)
return string-length(string-join($doc//tei:quote//text()))
}
</quote>

</counts>