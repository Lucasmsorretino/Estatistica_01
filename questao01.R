# Carregar os dados
load("salarios.RData")

# Verificando estrutura dos dados
str(salarios)

# Gráficos box-plot para variáveis age e husage
par(mfrow=c(1,2)) # gráficos lado a lado
boxplot(salarios$age,
        main = "Box-plot - Idade das Esposas",
        ylab = "Idade",
        col = "lightblue")

boxplot(salarios$husage,
        main = "Box-plot - Idade dos Maridos",
        ylab = "Idade",
        col = "lightgreen")

# Histograma para variáveis age e husage
par(mfrow=c(1,2)) # gráficos lado a lado
hist(salarios$age,
     main = "Histograma - Idade das Esposas",
     xlab = "Idade",
     ylab = "Frequência",
     col = "lightblue",
     breaks = 15)

hist(salarios$husage,
     main = "Histograma - Idade dos Maridos",
     xlab = "Idade",
     ylab = "Frequência",
     col = "lightgreen",
     breaks = 15)

# Tabela de frequência das variáveis age e husage
tabela_age <- table(salarios$age)
tabela_husage <- table(salarios$husage)

# Exibindo tabelas de frequência
print("Tabela de Frequências - Idade das Esposas:")
print(tabela_age)

print("Tabela de Frequências - Idade dos Maridos:")
print(tabela_husage)

# Comparação dos resultados em tabelas
par(mfrow=c(1,2)) # gráficos lado a lado para frequência
barplot(tabela_age, 
        main="Frequência - Idade das Esposas",
        xlab="Idade",
        ylab="Frequência",
        col="lightblue")

barplot(tabela_husage, 
        main="Frequência - Idade dos Maridos",
        xlab="Idade",
        ylab="Frequência",
        col="lightgreen")

# Resetar configuração gráfica
par(mfrow=c(1,1))

# Resumo Comparativo dos Resultados das Variáveis "age" (idade da esposa) e "husage" (idade do marido)
# 1. Box-plot
# Ambas as distribuições mostram medianas bem posicionadas visualmente.
# 
# A variável "husage" apresenta maior amplitude total (de 19 a 86 anos) em comparação com "age" (de 18 a 59 anos), o que sugere maior variabilidade entre os maridos.
# 
# Além disso, "husage" apresenta valores extremos mais distantes, indicando maior número de outliers — especialmente em idades mais elevadas.
# 
# 2. Histograma
# As distribuições são semelhantes, com leve assimetria positiva em ambos os casos (média > mediana), especialmente para os maridos.
# 
# Há uma maior concentração de esposas em faixas de idade mais baixas, enquanto os maridos estão mais distribuídos e com cauda à direita.
#
# 3. Tabela de Frequências
# A frequência modal (idades mais comuns) das esposas tende a se concentrar nas faixas de 30 a 40 anos.
# 
# Já para os maridos, as faixas com maior frequência estão mais deslocadas para a direita (35 a 50 anos).
# 
# Isso reflete a diferença esperada de idade entre casais, com maridos geralmente mais velhos.
# 
# Conclusão
# A variável "husage" é mais dispersa e apresenta outliers mais evidentes.
# 
# A distribuição de "age" é mais compacta e simétrica.
# 
# Ambos os gráficos e tabelas reforçam o padrão de idade entre esposas e maridos, com os maridos tendendo a ser mais velhos.
# 
