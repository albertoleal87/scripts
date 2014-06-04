#Configuración basica
workspace = "/Applications/MAMP/htdocs/"
output    = "/Users/alberto.leal/Downloads/"
proyecto  = "portal"
#branch    = "develop"
filename  = "#{proyecto}_#{Time.now.strftime "%Y%m%d"}.zip"

# commits separados por espacios
commits = "bf82324 01e153e 7e22ca0 843bcb6 b65b5f3 731c919 fe2ec70 f858b3d 3d93c32"

#Se posiciona en proyecto
Dir.chdir("#{workspace+proyecto}")

#Genera nombres de los archivos de los commits
commit_files = %x[git show --pretty=\"format:\" --name-only #{commits}]

#Genera arreglo con nombres de archivos
commit_files_array = commit_files.split("\n").uniq 

#Prepara lista de archivos
files = ""
commit_files_array.each do |file|
  #puts file
  files << file+" "
end

#Ejecuta comando para generar paquete de archivos
#cmd = "git archive --format=zip #{branch} #{files} > #{output+filename}"
cmd = "zip #{output+filename} #{files}"

system(cmd)

#Imprime directorio de salida
puts "\nOutput file: #{output+filename}"
