//Obtener una lista de todos los archivos de markdown en el directorio.
SubProceso list <- getDirList (path)
	
Fin SubProceso

//Analizar el archivo y buscar todos los enlaces dentro de �l.
SubProceso links <- getLinks ( path )
	
Fin SubProceso

//Comprobar si es una ruta de archivo o directorio.
SubProceso type <- detectTypePath ( path )
	Si directorio Entonces
		type = directorio;
	FIN SI
	Si archivo Entonces
		//Comprobar si es un archivo markdown
		SI markdown Entonces
			type = markdown;
		FinSi
	SiNo
		errorMessage = "Error";
	Fin Si
	
Fin SubProceso

SubProceso pathValid <- validatePath ( path )
	//Usar m�todo para validar el path
	Si path Entonces
		pathValid = true;
	SiNo
		pathValid = false;

	Fin Si
	
Fin SubProceso

SubProceso variable_de_retorno <- mdLinks (  )
	
Fin SubProceso

//Verificar argumento de ruta ingresado por usuario.
SubProceso linkFinded <- isLink ( userInput )
	//	const regex = "/md-links\s+(.+)/";
	// regex.test(userInput)
	Si userInput Entonces
		//userInput.replace(/^md-links\s+/, '');
		linkFinded = './some/example.md --validate';		
	//Sino mostrar un mensaje de error y salir del programa.
	SiNo
		errorMessage  = "Error message. Quit Programm";
		
	Fin Si
	
Fin SubProceso



Proceso Link
	
	Escribir "Ingrese link a testear. Formato: md-links <path-to-file> [options] ";
	Leer userLink;
	a = isLink(userLink);
	//Si se proporciona una ruta, verificar si es una ruta v�lida y si existe.
	b= validatePath(a);
	c= detectTypePath(a);
	
	Si c = "directorio" Entonces
		dirList = getDirList(a);
	FIN SI
	SI C = "markdown" ENTONCES
		linksList =getLinks(a);
	SiNo
		acciones_por_falso
	Fin Si

	
FinProceso





							
//	Si se proporciona la opci�n --validate, comprobar si el enlace es v�lido o no.
//	Si el enlace es v�lido, agregar una propiedad "ok" al objeto de enlace y establecerla en "ok".
//	Si el enlace no es v�lido, agregar una propiedad "ok" al objeto de enlace y establecerla en "fail".
//	Agregar los objetos de enlace a un array.
//	Si se proporciona la opci�n --stats, calcular estad�sticas sobre los enlaces encontrados.
//	Si se proporciona la opci�n --stats y --validate, calcular estad�sticas adicionales basadas en los resultados de validaci�n.
//	Mostrar los resultados de los enlaces y las estad�sticas (si se proporcionan).
//	Fin.
//
