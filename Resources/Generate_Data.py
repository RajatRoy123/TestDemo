import random
import string

def Randomnumber():
    V = random.randint(999999999,10000000000)
    return V



def RandomString(lenofsting=10):
    RanString= ''.join(random.choices(string.ascii_uppercase+string.ascii_letters,k=lenofsting))
    return RanString

