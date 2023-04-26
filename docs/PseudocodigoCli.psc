Proceso cli
	//Recibir comando del usuario
	Leer userCli;
	//Validar si existe argumento ingresado por usuario en Cli
	Si userCli Entonces
		//Detectar si ruta es relativa o absoluta
		Si rutaRelativa Entonces
			//(opcional)Si es relativa trasnformar a absoluta
			transformarAbsoluta<-'c:/de/mos/tra/ci�n'; 
		SiNo
			//Detectar si fue ingresada la opci�n --validate en cli
			// md-links < path> -- validate --stats
			Si validate Entonces
				//Detectar si fue ingresada la opci�n --stats en cli
				Si stats Entonces
					//Invocar md-links 
					resultados<-md-links;
					//(then)Imprimir estad�sticas que necesiten de resultados de validaci�n
					Repetir
						Escribir Total;
						Escribir Unique;
						Escribir Broken;
					Hasta Que termineItireracion
				SiNo
					//Invocar md-links 
					resultados<-md-links;
					//(then) Imprimir URL encontrada, texto que aparec�a dentro del link (<a>),
					//ruta del archivo donde se encontr� el link, estado del http, mensaje del estado (ok o fail).
					Repetir
						Escribir href;
						Escribir text;
						Escribir file;
						Escribir Status;
						Escribir MessageStatus;
					Hasta Que termineItireracion
				Fin Si
			SiNo
				//Detectar si fue ingresada la opci�n --stats en cli.
				Si stats Entonces
					//Invocar md-links 
					resultados<-md-links;
					//(then)Imprimir estad�sticas que necesiten de resultados de validaci�n
					Repetir
						Escribir Total;
						Escribir Unique;
					Hasta Que termineItireracion
				SiNo
					//Invocar md-links 
					resultados<-md-links;
					//(then)Imprimir por defecto URL encontrada, texto que aparec�a dentro del link (<a>),ruta del archivo donde se encontr� el link.
					//foreach
					Repetir
						Escribir href;
						Escribir text;
						Escribir file;
					Hasta Que termineItireracion
				Fin Si
			Fin Si
		Fin Si
	SiNo
		//Imprimir mensaje de error
		Escribir 'Error: No se ha ingresado ruta en cli.';
	Fin Si
	
	
FinProceso
