<HTML><TITLE>readdir</TITLE></HEAD>

<BODY BGCOLOR="#FFFFFF">
<!--
<FONT FACE="Arial,Helvetica">
-->
<H2>Download Page</H2>
 
The files downloadable from this page are:
<UL>
<?php
    $handle=opendir('.');
    while ($file = readdir($handle)) 
    {
       if (($file != ".") && 
           ($file != "..") && 
           ($file != "index.php") &&
           ($file != "index.html") &&
           ($file != "default.htm"))
       {
          echo "<LI> <A HREF=\"$file\">dir.txt</A></LI>\n";
       }
    }
    closedir($handle);
?>
</UL>

<!--
</FONT>
-->
</BODY></HTML>
