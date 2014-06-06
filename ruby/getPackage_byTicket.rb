#Configuración basica
workspace = "/Applications/MAMP/htdocs/"
output    = "/Users/alberto.leal/Downloads/"
proyecto  = "portal"
filename  = "#{proyecto}_#{Time.now.strftime "%Y%m%d"}.zip"

# ticket o patron a buscar en los commits
ticket = "SBO-133";

#Se posiciona en proyecto
Dir.chdir("#{workspace+proyecto}")

#Genera nombres de los archivos de los commits
file_list = %x[git log --pretty=format: --name-only --grep="#{ticket}"]
file_list_status = %x[git log --pretty=format: --name-status --grep="#{ticket}"]

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
