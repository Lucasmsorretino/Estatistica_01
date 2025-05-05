# Carregar pacote nortest 
library(nortest)

# Configurando para não aparecer notação científica nos
# resultados
options(scipen = 999)

# Carregar os dados
load("salarios.RData")

# Critérios:
# Critério #1: As amostras são emparelhadas ou independentes? São independentes.
# Critério #2: As amostras são normalmente distribuídas? 
str(salarios)
# Temos 2 grupos independentes com 5634 observações

# Executando testes de normalidade com Kolmogorov-Smirnov com correção de 
# Lilliefors, pois é uma amostra muito grande para usar o teste de Shapiro-Wilk.
ks_age <- lillie.test(salarios$age)
# p-value < 0.00000000000000022
ks_husage <- lillie.test(salarios$husage)
# p-value < 0.00000000000000022

# Como p-value para os dois grupos é < 0,05 entendemos que as amostras NÃO são
# normalmente distribuídas, logo é necessário aplicar um teste não parámetrico e
# usar MEDIANAS como medidas de tendência central. Como desejamos testar se a
# mediana de dois grupos independentes são estatisticamente equivalentes 
# usaremos o teste Mann-Whitney "U" para apurar as hipóteses abaixo.

# Hipoteses do teste:
# H0: A idade mediana das esposas é estatisticamente igual a idade mediana
#     dos maridos.
# H1: A idade mediana das esposas não é estatisticamente igual a idade mediana
#     dos maridos.

# Agrupando os dados em um novo dataframe
grouped_ages <- data.frame(
  group = rep(c("age", "husage"), each=nrow(salarios)),
  age = c(salarios$age, salarios$husage)
)

# Executando o teste de Mann-Whitney "U" conforme ministrado nas aulas
res <- wilcox.test(age ~ group, data = grouped_ages,
                   exact = FALSE, conf.int=TRUE)
res
# Output:

# Wilcoxon rank sum test with continuity correction
# 
# data:  age by group
# W = 13619912, p-value < 0.00000000000000022
# alternative hypothesis: true location shift is not equal to 0
# 95 percent confidence interval:
#   -3.000024 -2.000033
# sample estimates:
#   difference in location 
# -2.999966 

# Interpretação:
  # 1) o valor de p << 0,05, logo REJEITAMOS a hipótese nula e aceitamos a hípotese
# alternativa, ou seja: A idade mediana das esposas não é estatisticamente igual
# a mediana dos maridos.
# 2) Para um intervalo de confiança de 95%, a diferença entre a mediana dos dois grupos
# (comparando idade das esposas frente a idade dos maridos) é de -3,0 e -2,0.
# 3) difference in location ~ -2,999 ou seja, a mediana da idade das esposas é 
# aproximadamente 3 anos menor do que a mediana da idade dos maridos.
