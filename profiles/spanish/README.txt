-------------------------------------------------------------------------------
Este es el perfil de instalación en Español.
Seguir los pasos siguientes:

Instalar Drupal

- Descargar e instalar la última versión de Drupal 7.x(por ejemplo, drupal-7.8)
- Instalar el CKeditor de http://ckeditor.com/download e instalarlo en 
  'sites/all/libraries'
- Descargar los módulos contribuidos de la lista inferior e instalarlos en 
  'sites/all/modules'

Copie el instalador en Español

- Descargar el archivo de instalación y extráigalo en el direcorio 'profiles/'
- Si desea descargue el último archivo 'es.po.txt' y reemplace 'es.po'
  en el directorio 'translations/'

El idioma Español se definirá de manera automática
Continue con los pasos de instalación de Drupal

**************

Las siguientes configuraciones se definirán de manera automática:

Configura Pathauto para trabajar con el módulo transliterate.
Adiciona palabras en español a los términos eliminados en pathauto
Define Captcha Image con opción predeterminada de Captcha
Define el directorio 'sites/default/files/private' como directorio 
privado predeterminado.

Este directorio debe ser creado y configurado manualmente
Define los formatos de Hora y Fecha predeterminados en forma:}
- date_format_short, 'd/m/Y - H:i'
- date_format_medium, 'D, d/m/Y - H:i'
- date_format_long, 'l, j F, Y - H:i'
Crea un rol editor

***************

Para modificar el valor de las variables predefinidas, deberá renombrar el
archivo 'includes/spanish.inc.txt' a 'includes/spanish.inc.txt', y hacer 
los cambios que estime conveniente


***************

Se predefinen los módulos siguientes:
backup_migrate
ckeditor
css_emimage
ctools
devel
dhtml_menu
ds
filefield_paths
imce
l10n_client
l10n_update
libraries
logintoboggan
page_title
pathauto
entity
entityreference
token
transliteration
views
admin_menu
fusion_accelerator
diff
google_analytics
typogrify
features
media
link
context
luxe
date
webform
jquery_update
xmlsitemap
views_slideshow
globalredirect
metatag

; themes
fusion
tao
rubik
