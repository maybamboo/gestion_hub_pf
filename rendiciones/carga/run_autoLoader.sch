javapath=/usr/java/jdk1.7.0_71/bin
autoLoader=autoLoader-0.0.1-SNAPSHOT.jar

echo "Ejecutando autoLoader";
echo "---------------------";

for param in "$*"
do
	${javapath}/java -jar ${autoLoader} $param
done


STATUS="${?}"
echo "Salida: ${STATUS}"

exit 0;
