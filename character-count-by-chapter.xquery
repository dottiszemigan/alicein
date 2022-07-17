xquery version "3.1";
declare namespace tei="http://www.tei-c.org/ns/1.0"; 

let $chapters := (doc("AliceInWonderland.xml")//tei:text//tei:div1)
return <results>
{
    for $ch in $chapters
    return 
        <chapter title="{$ch//tei:head}">  {
        let $names := $ch//tei:name
        for $pers in distinct-values(data($names/@ref))
        let $items := $names[@ref=$pers]
        return <character name="{$pers}" count="{count($items)}"/>
    }
    </chapter>
    
     

}</results>
