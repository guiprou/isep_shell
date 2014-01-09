read resultatflux.txt
echo "<![CDATA[]]"  
read word1
echo ">"
read word2
grep $word1 $word2 | sed -e $word1 -e $word2