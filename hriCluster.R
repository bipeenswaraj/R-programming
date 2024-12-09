iris
iris1=iris
iris1
iris1$Species  =NULL
iris1   
d = dist(iris1 , method = "euclidean")
hir = hclust(d, method="average")
plot(hir)
grps = cutree(hir,k=5)
grps
rect.hclust(hir,k=5,border = 'blue')


PlantGrowth
P1=PlantGrowth
P1
P1$Growth  =NULL
P1   
d = dist(P1 , method = "euclidean")
hir = hclust(d, method="average")
plot(hir)
grps = cutree(hir,k=5)
grps
rect.hclust(hir,k=5,border = 'blue')
rect.hclust

#dendrogrma decide how many cluster is there


mtcars
d=mtcars
d
summary(d)
d$mpg=NULL
d
summary(d)
dis=dist(d,method="euclidean")
dis
hir=hclust(dis,method = "average")
plot(hir)
g=cutree(hir,k=3)
g
rect.hclust(hir,k=3,border="red")














