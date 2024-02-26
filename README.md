# rhacm

## But

Deployer des operateurs sur des clusters ayant le label **stack=telco** puis deployer des configurations differentes par Cluster.

## Deploiement:

1. Ajouter les label **stack=telco** sur les clusters concernés  
2. Se logger sur le rhacm en CLI avec un utilisateur ayant les droits **open-cluster-management:subscription-admin**

```shell
oc adm policy add-cluster-role-to-user open-cluster-management:subscription-admin <username>
```

3. Lancer:

```shell
oc apply -f policy-sets/subscription.yaml
```