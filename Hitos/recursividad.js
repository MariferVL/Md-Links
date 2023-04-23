import fs from 'fs';
import chalk from 'chalk';
import path from 'path';

/* HITO 5 */

/**
 * Read a .md file and Print href, text, file name and extension.
 * @returns
 */
export function mdLinks(folderPath) {
  const stats = fs.statSync(folderPath);
  if (stats.isDirectory()) {
    // console.log(chalk.bgHex('#FFE162').bold(`\n\nArchivos en Carpeta ${folderPath}:\n`));
    const files = fs.readdirSync(folderPath);
    files.forEach(file => {
      const filePath = path.join(folderPath, file);
      //FIXME: Recursividad bien lograda?
      mdLinks(filePath);
    });
  } else if (stats.isFile()) {
    const ext = path.extname(folderPath);
    const fileName = path.basename(folderPath);
    if (ext === '.md') {
      fs.readFile(folderPath, 'utf-8', (err, data) => {
        if (err) {
          console.error(chalk.whiteBright.bgRedBright.bold('Error: '), chalk.redBright(`al leer el archivo: ${err}`));
        } else {
          const regex = /\[(?<text>.*?)\]\((?<url>.*?)\)/g;
          let match;
          //FIXME: Agregar ruta absoluta o solo nombre de archivo?
          console.log(chalk.bgHex('#00F5FF').bold(`\nContenido de ${fileName}: \n`));
          // console.log(chalk.bgHex('#00F5FF').bold(`\nContenido de ${folderPath}: \n`));

          while ((match = regex.exec(data)) !== null) {
            console.log(chalk.bgHex('#EA047E').bold('href:      '), chalk.hex('#EA047E')(match[2]));
            console.log(chalk.bgHex('#FF6D28').bold('Texto:     '), chalk.hex('#FF6D28')(match[1]));
            console.log(chalk.bgHex('#FCE700').bold('Ruta:      '), chalk.hex('#FCE700')(folderPath));
            console.log(chalk.bgHex('#00F5FF').bold('Extension: '), chalk.hex('#00F5FF')(ext));
            console.log('');
          }
        }
      });
    }
  } else {
    console.error(chalk.whiteBright.bgRedBright.bold('Error: '), chalk.redBright(`La ruta ${folderPath} no es válida`));
  }
}

function detectFolderPath() {
  const folderPath = process.argv[2];
  if (!folderPath) {
    console.error(chalk.whiteBright.bgRedBright.bold('Error: '), chalk.redBright('Debes ingresar la ruta de la carpeta a leer'));
  } else {
    console.log(chalk.magentaBright.bgWhiteBright.underline.bold('\n\n\t\t\t\t MD Links '));
    //FIXME: Recursividad bien lograda?
    mdLinks(path.resolve(folderPath));
  }
}

detectFolderPath();


