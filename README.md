# Modulation analogique

En télécommunications, le signal transportant une information doit passer par un moyen de transmission
entre un émetteur et un récepteur. Le signal est rarement adapté à la transmission en bande de base.
Ainsi, si nous pensons aux transmissions en espace libre, on s’appercoit rapidement au probléme des
dimensions des antennes a utiliser à l’èmission et la rèception. Les dimensions des antennes doivent être
de l’ordre de grandeur de la longueur d’onde λ associée à l’onde électromagnétique émise (f = 1kHz, λ =
c/f = 300km). On comprend ainsi rapidement qu’il faut translater le signal à transmettre vers de plus
hautes fréquences.

La translation vers les hautes fréquences est réalisée en appliquons les techniques de modulation. Le
signal à transmettre est utilisé pour moduler une porteuse de fréquence plus adaptée au canal que celles
dans la bande de base du signal modulant. En effet, le signal modulant influe soit sur l’amplitude de la
porteuse, soit sur sa fréquence ou sa phase.

Dans ce TP, nous voulons simuler quelques techniques de modulation pour les comparer. L’environment
de simulation est MATLAB, nous n’allons pas utiliser la Communications System Toolbox de MATLAB
mais plutot implementer nos propres fonctions basées sur les modéles mathématiques étudiés dans le
cours de transmissions à l’ENSI. Ceçi facilitera la migration vers d’autres plateformes de simulation
comme Octave, Python ou R.
