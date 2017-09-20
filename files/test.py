from cassandra.cluster import Cluster
import sys
import os
from os import environ

ty = os.getenv('passy')

print(ty)

cluster = Cluster([ty])

keyspace = 'northwind'

connection = cluster.connect(keyspace)

first_orders = connection.execute('select * from orders limit 5')

for order in first_orders:
    print("Orders %d - To city %s" %(order.ordersid, order.shipcity.encode('utf-8')))

