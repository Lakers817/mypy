from cassandra.cluster import Cluster
import sys
import os
from os import environ
import unicodedata

# code start now

ty = os.getenv('cass')

print(ty)

cluster = Cluster([ty])

keyspace = 'northwind'

connection = cluster.connect(keyspace)

first_orders = connection.execute('select * from orders limit 7')

for order in first_orders:
    print("Orders %d - To city %s" %(order.ordersid, order.shipcity.encode('utf-8')))
