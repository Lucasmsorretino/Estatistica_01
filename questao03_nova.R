# Carregar os dados
load("salarios.RData")

# Carregar pacote nortest 
library(nortest)

# Testes de normalidade com Anderson-Darling, pois é uma amostra muito grade par ao shapiro.
ad_age <- ad.test(salarios$age)
ad_husage <- ad.test(salarios$husage)

# Teste de homogeneidade de variâncias
var_test <- var.test(salarios$age, salarios$husage)


# Teste de Mann-Whitney para medianas
teste_result <- wilcox.test(salarios$age, salarios$husage, exact = FALSE, conf.int = TRUE)
metodo <- "Teste de Mann-Whitney (não paramétrico)"
estatistica <- "medianas"


# Exibir resultados
cat("\n== Testes de normalidade (Anderson-Darling) ==\n")
cat("Idade das Esposas: p =", ad_age$p.value, "\n")
cat("Idade dos Maridos: p =", ad_husage$p.value, "\n")

cat("\n== Teste de variância (Teste F) ==\n")
cat("p =", var_test$p.value, "\n")

cat("\n== Teste aplicado: ", metodo, "==\n")
cat("Comparação entre", estatistica, "\n\n")
print(teste_result)

# 
#   Questão 3 – Testes paramétricos ou não paramétricos
# a) Testar se as médias ou medianas de “age” (esposa) e “husage” (marido) são estatisticamente iguais
# Testes preliminares
# Normalidade – Anderson-Darling:
#   Idade das esposas: p = 3.7e-24
# 
# Idade dos maridos: p = 3.7e-24
# 
# Ambas as variáveis apresentam p-valores extremamente baixos, rejeitando a hipótese de normalidade. Portanto, não é apropriado aplicar o teste t.
# 
# Homogeneidade de variâncias – Teste F:
#   p = 1.68e-18
# 
# O resultado também rejeita a hipótese de variâncias iguais, reforçando a inadequação do teste t com variâncias homogêneas.
# 
#   Teste aplicado: Mann-Whitney (não paramétrico)
# Dado que:
#   
#   As duas variáveis não seguem distribuição normal (p < 0,05 nos dois casos);
# 
# As variâncias não são homogêneas (p < 0,05);
# 
# Aplicou-se o teste de Mann-Whitney U, que é apropriado para comparar medianas entre dois grupos independentes sem pressupor normalidade.
# 
# Resultado do Teste de Mann-Whitney:
#   Estatística W: 13.619.912
# 
# p-valor: < 2.2e-16
# 
# Intervalo de confiança da diferença de medianas (95%):
#   −
# 3.000024
# ,
# −
# 2.000033
# −3.000024,−2.000033
# 
# Estimativa da diferença de localização (mediana): -2.999966
# 
# Interpretação:
#   O p-valor extremamente pequeno indica que existe uma diferença estatisticamente significativa entre as medianas das idades das esposas e dos maridos.
# 
# O intervalo de confiança da diferença de medianas não contém o valor zero, e encontra-se completamente abaixo de 0. Isso indica que a mediana da idade dos maridos é significativamente maior que a das esposas, com uma diferença estimada de aproximadamente 3 anos.
# 
#   Conclusão Final:
#   Com base nos testes realizados:
#   
#   As idades das esposas e dos maridos não têm medianas iguais;
# 
# Os maridos tendem a ser estatisticamente mais velhos que as esposas;
# 
# A diferença mediana estimada é de aproximadamente 3 anos, com 95% de confiança de que a diferença está entre 2 e 3 anos.
# 
# Portanto, os resultados sustentam uma diferença estatisticamente significativa nas idades, com forte suporte inferencial, conforme exigido pela questão.
