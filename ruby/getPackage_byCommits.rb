#Configuración basica
workspace = "/Applications/MAMP/htdocs/"
output    = "/Users/alberto.leal/Downloads/"
proyect  = "portal"
filename  = "#{proyect}_#{Time.now.strftime "%Y%m%d"}.zip"

# commits separados por espacios en blanco
commits = "bf82324 01e153e 7e22ca0 843bcb6 b65b5f3 731c919 fe2ec70 f858b3d 3d93c32"

#Se posiciona en proyecto
Dir.chdir("#{workspace+proyect}")

#Genera nombres de los archivos de los commits
file_list = %x[git show --pretty=format: --name-only #{commits}]
file_list_status = %x[git show --pretty=format: --name-status #{commits}]

puts file_list_status.split("\n").uniq 

#Genera arreglo con nombres de archivos
commit_files_array = file_list.split("\n").uniq 

#Prepara lista de archivos
files = ""
commit_files_array.each do |file|
  files << file+" "
end

#Ejecuta comando para generar paquete de archivos
%x[zip #{output+filename} #{files}]

#Imprime directorio de salida
puts "\nOutput file: #{output+filename}"
