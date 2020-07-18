def calc_GS(x, iteration):
  rst = 1
  for i in range(iteration):
    rst = rst * (1+x**i)
    
  return rst

def app_GS(n,d,iteration):
  return n/2*calc_GS(1-d/2, iteration)

def err(n,d):
  return n/d - app_GS(n,d,5)
  
  
