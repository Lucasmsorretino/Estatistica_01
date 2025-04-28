# Certifique-se que o arquivo 'salarios.RData' está carregado
load("salarios.RData")

# Medidas de posição (média, mediana e moda)
# Função para calcular moda
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Variáveis
idade_esposas <- salarios$age
idade_maridos <- salarios$husage

# Média
media_esposas <- mean(idade_esposas)
media_maridos <- mean(idade_maridos)

# Mediana
mediana_esposas <- median(idade_esposas)
mediana_maridos <- median(idade_maridos)

# Moda
moda_esposas <- getmode(idade_esposas)
moda_maridos <- getmode(idade_maridos)

# Medidas de dispersão (variância, desvio padrão e coeficiente de variação)
# Variância
var_esposas <- var(idade_esposas)
var_maridos <- var(idade_maridos)

# Desvio padrão
dp_esposas <- sd(idade_esposas)
dp_maridos <- sd(idade_maridos)

# Coeficiente de variação (em porcentagem)
cv_esposas <- (dp_esposas / media_esposas) * 100
cv_maridos <- (dp_maridos / media_maridos) * 100

# Resultados
cat("== Medidas de posição ==\n")
cat("\nIdade das Esposas:\n")
cat("Média:", media_esposas, "\nMediana:", mediana_esposas, "\nModa:", moda_esposas, "\n")

cat("\nIdade dos Maridos:\n")
cat("Média:", media_maridos, "\nMediana:", mediana_maridos, "\nModa:", moda_maridos, "\n\n")

cat("== Medidas de dispersão ==\n")
cat("\nIdade das Esposas:\n")
cat("Variância:", var_esposas, "\nDesvio Padrão:", dp_esposas, "\nCoeficiente de Variação (%):", cv_esposas, "\n")

cat("\nIdade dos Maridos:\n")
cat("Variância:", var_maridos, "\nDesvio Padrão:", dp_maridos, "\nCoeficiente de Variação (%):", cv_maridos, "\n")




# Medidas de Posição:
#   
#       	Esposas ("age")	Maridos ("husage")
# Média	  39,43	          42,45
# Mediana	39	            41
# Moda	  37	            44
# 
# 
# A média e mediana das idades dos maridos são superiores às das esposas, evidenciando que os maridos tendem a ser mais velhos.
# 
# A moda indica que a idade mais frequente entre as esposas foi 37 anos, e entre os maridos foi 44 anos, reforçando essa diferença.
# 
# Em ambas as variáveis, a média é maior que a mediana, indicando leve assimetria positiva (cauda à direita), especialmente entre os maridos.
#   
#                           Esposas ("age")	Maridos ("husage")
# Variância	                99.75234	      126.0717
# Desvio padrão	            9.98761	        11.22817 
# Coeficiente de variação	  25.33153        26.44849 
#   
# 
# A dispersão é maior entre os maridos em todas as medidas, tanto absolutas quanto relativas.
# 
# O coeficiente de variação, que mede a dispersão em relação à média, mostra que as idades dos maridos são ligeiramente mais heterogêneas do que as das esposas.
# 
# Conclusão:
#   As medidas de posição confirmam que os maridos são, em média, mais velhos que as esposas.
# As medidas de dispersão indicam que há maior variabilidade na idade dos maridos, o que está de acordo com os resultados gráficos da questão anterior.
# Ambas as variáveis apresentam distribuições assimétricas à direita, com dispersão moderada, e valores que reforçam o padrão demográfico comum observado.