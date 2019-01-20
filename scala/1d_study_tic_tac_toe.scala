def splitAll[T](list: List[T],n: Int): List[List[T]] =
  if(list.size <= n) List(list.take(n))
  else List(list.take(n)) ++ splitAll(list.drop(n),n)

def rotationSqure[T](nestList: List[List[T]],n :Int = 0): List[List[T]]  =
  if(nestList.size <= n) List()
  else List(nestList.map(line => line(n))) ++ rotationSqure(nestList,n+1)

def slantingLine[T](nestList: List[List[T]],n :Int, f: Int => Int): List[T]  =
  if(nestList.isEmpty) List()
  else List(nestList.head(n)) ++ slantingLine(nestList.tail,f(n),f)

def win[T](list: List[List[T]], icon: T) = list.exists(line=>line.forall(v=> v==icon))

val box = splitAll(args(0).split("").toList,3)
val rbox = rotationSqure(box)
val slantingBox = List(slantingLine(box,0,i=>i+1),slantingLine(box,box.size - 1,i=>i-1))

val win_o = List(box,rbox,slantingBox).exists(list=>win(list,"o"))
val win_x = List(box,rbox,slantingBox).exists(list=>win(list,"x"))

box.foreach { line =>
  println(line.reduce((r,s)=> r + "|" + s))
}

println()

rbox.foreach { line =>
  println(line.reduce((r,s)=> r + "|" + s))
}

println()
println("winner:" + (if(win_o) "o" else if (win_x) "x" else "_"))
