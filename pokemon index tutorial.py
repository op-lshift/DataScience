##import data
import pandas as pd


poke = pd.read_csv('pokemon.csv')

print(poke.tail(3))

#Read headers
print(poke.columns)

# Read each column
print(poke[['Name','Type 1','HP']][0:5])

## Read Each Row using interger location iloc, iterrows
print(poke.iloc[1])
for index,row in poke.iterrows():
    print (index,row)
poke.loc[poke['Type 1'] == 'Grass']


# Read a specific location (R,C)
print(poke.iloc[2,1])

# Sort values using the sort_values function
poke.sort_values(['Type 1','HP'], ascending = [1,0])

## Making changes to the data
poke['Total'] = poke['HP'] + poke['Attack'] + poke['Defense'] + poke['Sp. Atk'] + poke['Sp. Def'] + poke['Speed']
##poke = poke.drop(columns = ['Total'])

print(poke)
cols = list(poke.columns)
print(cols)
poke = poke[cols[0:4] + [cols[-1]] + cols[4:12]]
poke.head(5)

## Saving a new .csv file
poke.to_csv('new pokemon.csv', index = False)

## Filtering the data and generating a new dataframe with index reset
newpoke = poke.loc[(poke['Type 1'] == 'Grass') & (poke['Type 2'] == 'Poison') & (poke['Total'] > 150)]

newpoke.reset_index(drop = True, inplace = True)

## Filter certain words
poke.loc[poke['Name'].str.contains('pi[a-z]*')]

## Conditional changes
poke.loc[poke['Legendary'] == 'FALSE\', ['Legendary']] = False

## Group data
poke['count'] = 1
poke.groupby(['Type 1','Type 2']).count()

## working with large amount of data - Separating the data

for df in pd.read_csv('new pokemon.csv',chunksize = 5):
    print('Separator')
    print(df)
