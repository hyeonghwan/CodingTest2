////
////  main.swift
////  coding
////
////  Created by 박형환 on 2023/05/10.
////
import Foundation

//3
//10 12 3 9
//10 12 7 2
//13 11 5 6

//33
//-1
//83

//10 , 12 , 3,9
//10x + 3 = y
//12x + 9 = y
//2x - 6 = 0
//x = (x - y) / (N - M)

// 13, 11, 5, 6
// 13k + 5 = y
// 11z + 6 = y
// 13k - 11z - 1 = 0
// N*k = M*z + (x - y)
// N*k - M*z = x - y
// K + Z ( N - M)
// KN - ZM -KM + ZN = x - y

func kaingCalendar(){
    var num = Int(readLine()!)!
    var result: [Int] = []
    for _ in 0..<num{
        let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
        let M = input[0]
        let N = input[1]
        let x = input[2]
        let y = input[3]
        let k = solve(M: M, N: N, x: x, y: y)
        result.append(k)
    }
    
    result.forEach{
        print($0)
    }
}
kaingCalendar()

func solve(M: Int, N: Int,x: Int, y: Int) -> Int{
    let l = lcm(a: M, b: N)
    var c = 0
    for i in 1..<l + 1{
        if i % M == x{
            c = i
            break
        }
    }
    
    while c < l + 1{
        if (c  %  M == x) && (c % N == y){
            return c
        }
        c += M
    }
    return -1
}
//GCD
func gcd(a: Int, b: Int) -> Int{
    if (b == 0) {return a}
    return gcd(a: b, b: a % b)
}

func lcm(a: Int,b: Int) -> Int{
    return (a / gcd(a: a, b: b)) * b
}

//에라토네스체 소수
func eratonesCheDecimal(){
    // O(loot(N))
    var n: Int = Int(readLine()!)!
    var i: Int = 2
    while (i * i <= n){
        while (n % i == 0){
            print("div : \(i)")
            n /= i
        }
        i += 1
    }
    if (n != 1){ print(n) }
}
//eratonesCheDecimal()


//다솜이는 유료 고속도로를 가지고 있다. 다솜이는 현재 고속도로에 휴게소를 N개 가지고 있는데, 휴게소의 위치는 고속도로의 시작으로부터 얼만큼 떨어져 있는지로 주어진다. 다솜이는 지금 휴게소를 M개 더 세우려고 한다.
//
//다솜이는 이미 휴게소가 있는 곳에 휴게소를 또 세울 수 없고, 고속도로의 끝에도 휴게소를 세울 수 없다. 휴게소는 정수 위치에만 세울 수 있다.
//
//다솜이는 이 고속도로를 이용할 때, 모든 휴게소를 방문한다. 다솜이는 휴게소를 M개 더 지어서 휴게소가 없는 구간의 길이의 최댓값을 최소로 하려고 한다. (반드시 M개를 모두 지어야 한다.)
//
//예를 들어, 고속도로의 길이가 1000이고, 현재 휴게소가 {200, 701, 800}에 있고, 휴게소를 1개 더 세우려고 한다고 해보자.
//
//일단, 지금 이 고속도로를 타고 달릴 때, 휴게소가 없는 구간의 최댓값은 200~701구간인 501이다. 하지만, 새로운 휴게소를 451구간에 짓게 되면, 최대가 251이 되어서 최소가 된다.
//6 7 800
//622 411 201 555 755 82
func highway_restPlace_1477(){
    let N_M_L: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))! }
    var location: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))! }
    location.insert(0, at: 0)
    location.append(N_M_L.last!)
    location.sort()
    print(location)
    var M = N_M_L[1]
    
    while M != 0 {
        var longPosition: Int = -1
        var index: Int = 0
        for i in 0..<(location.count - 1){
            let diff = (location[i + 1] - location[i])
            if  diff > longPosition{
                longPosition = diff
                index = i
            }
        }
        let value: Int = (location[index] + location[index + 1]) / 2
        
        location.insert( value, at: index + 1)
        M -= 1
    }
    var short: Int = -1
    for i in 0..<(location.count - 1){
        let diff = (location[i + 1] - location[i])
        if  diff > short{
            short = diff
        }
    }
    print(short)
}
//highway_restPlace_1477()
//4 7
//6 13
//4 8
//3 6
//5 12
func ordinary_backpack_12865(){
    let backpack: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))! }
    
    let num = backpack.first!
    let weight = backpack.last!
    
    // 0 - weihgt
    // 1 - value
    var bArr: [[Int]] = []
    
    for _ in 0..<num{
        let array = readLine()!.split(separator: " ").map{ Int(String($0))! }
        if array.first! > weight{
            continue
        }
        bArr.append(array)
    }
    
    print(bArr)
}
ordinary_backpack_12865()

func boj_2217_rope(){
    let input = Int(readLine()!)!
    
    var ropes: [Int] = []
    for _ in 0..<input{
        ropes.append(Int(readLine()!)!)
    }
    ropes.sort()
    
    var max: Int = -1
    for i in stride(from: ropes.count - 1, to: -1, by: -1){
        let count = ropes.count - i
        let weight = ropes[i] * count
        if max < weight{
            max = weight
        }
    }
    print(max)
}
//boj_2217_rope()


func arrayReplace(){
    let input = Int(readLine()!)!
    var aArr: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))! }
    var bArr: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))! }
    aArr.sort(by: <)
    bArr.sort(by: >)
    var result: Int = 0
    for i in 0..<aArr.count{
        result += (aArr[i] * bArr[i])
    }
    print(result)
}
//arrayReplace()
// 백준 회의실 배정
//11
//1 4
//3 5
//0 6
//5 7
//3 8
//5 9
//6 10
//8 11
//8 12
//2 13
//12 14
//print(((100000 * 100000) + (100000 * log(100000.0))))
func conferenceRoom(){
    let input = Int(readLine()!)!
    var nArr: [[Int]] = []
    for _ in 0..<input{
        nArr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    
    nArr
    =
    nArr.sorted(by: { one, two in
        return one.last! != two.last! ? one.last! < two.last! : one.first! < two.first!
    })
    
    var la: Int = -1
    var result: Int = 0
    for i in 0..<nArr.count{
        if nArr[i].first! > la && nArr[i].last! > la{
            result += 1
            la = nArr[i].last!
        }
    }
    print(result)
}

//conferenceRoom()

//3 10
//1
//2
//5
func boj_coin_one(){
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let n = input.first!
    let k = input.last!
    
    var nArr: [Int] = []
    
    for _ in 0..<n{
        nArr.append(Int(readLine()!)!)
    }
    var dp: [Int] = Array(repeating: 0, count: k + 1 )
    
    dp[0] = 1
    
    var max = 1
    for i in 0...31{
        max *= 2
    }
    
    for i in 0..<nArr.count {
        if nArr[i] >= k + 1{
            continue
        }
        for j in nArr[i]..<k + 1 {
            if dp[j] + dp[j-nArr[i]] >= max {
                dp[j] = 0
            }
            dp[j] += dp[j - nArr[i]]
        }
    }
    
    print(dp[k])
}
//boj_coin_one()


//정수 X에 사용할 수 있는 연산은 다음과 같이 세 가지 이다.
//
//X가 3으로 나누어 떨어지면, 3으로 나눈다.
//X가 2로 나누어 떨어지면, 2로 나눈다.
//1을 뺀다.
//정수 N이 주어졌을 때, 위와 같은 연산 세 개를 적절히 사용해서 1을 만들려고 한다. 연산을 사용하는 횟수의 최솟값을 출력하시오.

//첫째 줄에 N과 K가 주어진다. (1 ≤ N ≤ 10, 1 ≤ K ≤ 100,000,000)
//둘째 줄부터 N개의 줄에 동전의 가치 Ai가 오름차순으로 주어진다. (1 ≤ Ai ≤ 1,000,000, A1 = 1, i ≥ 2인 경우에 Ai는 Ai-1의 배수)
func coinCaluate(){
    let NUM = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = NUM.first!
    let K = NUM.last!
    
    var value: [Int] = []
    
    for _ in 0..<N{
          value.append(Int(String(readLine()!))!)
    }
    
    func BT(_ index: Int, target: Int, result: Int){
        if target == 0 {
            print(result)
            return
        }
        
        for i in stride(from: index - 1, to: -1, by: -1){
            if value[i] <= target{
                let moc: Int = target / value[i]
                let rest: Int = target % value[i]
                return BT(index - 1, target: rest, result: result + moc)
            }
        }
    }
    
    BT(N, target: K, result: 0)
}
//coinCaluate()

func numberdivisonPath(num: Int){
    var num = num
    let max: Int = 1000000

    var dpValue: [Int] = Array(repeating: 0, count: max)
    var dpPath: [Int] = Array(repeating: 0, count: max)
    dpValue[2] = 1
    dpPath[2] = 1
    dpValue[3] = 1
    dpPath[3] = 1
}

func sumRange(){
    let num = readLine()!.split(separator: " ").map{Int(String($0))!}
    let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    var range: [(Int,Int)] = []
    
    for _ in 0..<num.last! {
        let line = readLine()!.split(separator: " ").map{Int(String($0))!}
        range.append((line.first!,line.last!))
    }
    
    var d: [Int] = Array(repeating: 0, count: 100000)
    d[0] = arr[0]
    d[1] = d[0] + arr[1]
    d[2] = d[1] + arr[2]
    
    for index in 3..<arr.count{
        d[index] = d[index - 1] + arr[index]
    }
    for (s,e) in range{
        var result: Int = 0
        
        if s == 1{
            result = d[e - 1]
        }else{
            result = d[e - 1] - d[s - 2]
        }
        print(result)
    }
}

//sumRange()

func tile(){
    let num = Int(String(readLine()!))!
    
    var d: [Int] = Array(repeating: 0, count: 10007)
    d[0] = 0
    d[1] = 1
    d[2] = 2
    
    if num <= 2{
        print(d[num])
        return
    }
    
    for i in 3..<num + 1{
        d[i] = (d[i - 1] + d[i - 2]) % 10007
        
    }
    print(d[num])
}

func rgbpath(){
//3
//26 40 83
//49 60 57
//13 89 99
    let num = Int(String(readLine()!))!
    var rgbArr: [[Int]] = []
    
    for _ in 0..<num{
        let v = readLine()!.split(separator: " ").map{ Int(String($0))!}
        rgbArr.append(v)
    }
    
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 3), count: rgbArr.count)
    
    dp[0][0] = rgbArr[0][0]
    dp[0][1] = rgbArr[0][1]
    dp[0][2] = rgbArr[0][2]
    
    for i in 1..<rgbArr.count{
        dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + rgbArr[i][0]
        dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + rgbArr[i][1]
        dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + rgbArr[i][2]
    }
    let m = min(dp.last![0], dp.last![1], dp.last![2])
    print(m)
}
//rgbpath()


func stairsDP(){
    let num = Int(String(readLine()!))!
    let stairCount = num
    
    var stairs: [Int] = [0]
    var dpStairs: [[Int]] = Array(repeating: Array(repeating: 0, count: 3), count: stairCount + 1)
    for _ in 0..<stairCount{
        stairs.append(Int(String(readLine()!))!)
    }
    
    if stairCount == 1 {
        print(stairs[1])
        return
    }
    if stairCount == 0{
        print(0)
        return
    }
    
    dpStairs[1][1] = stairs[1]
    dpStairs[1][2] = 0
    dpStairs[2][1] = stairs[2]
    dpStairs[2][2] = stairs[1] + stairs[2]
    
    for k in 3..<stairCount + 1{
        dpStairs[k][1] = max(dpStairs[k - 2][1], dpStairs[k-2][2]) + stairs[k]
        dpStairs[k][2] = dpStairs[k-1][1] + stairs[k]
    }

    print(max(dpStairs[stairCount][1], dpStairs[stairCount][2]))
    
}


func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
    let (size_g,g_board) = bfs(game_board, flag: false)
    let (size_t,t_board) = bfs(table, flag: true)
    let gameArr = getBaseTable(g_board)
    let puzzleArr = getBaseTable(t_board)
    
    var g_count: [[[Int]]?] = gameArr
    var visit: [Bool] = Array(repeating: false, count: puzzleArr.count)
    var cnt: Int = 0
    for i in 0..<gameArr.count{
        let ga_board = gameArr[i]
        let g_size = size_g[i]
        
    puzzle: for j in 0..<puzzleArr.count{
            if visit[j] == true{
                continue puzzle
            }
            if g_size == size_t[j] {
                if ga_board == puzzleArr[j]{
                    cnt += g_size
                    visit[j] = true
                    break puzzle
                }
                for k in 1..<3{
                    if ga_board == rotateCase(k,puzzleArr[j]){
                        cnt += g_size
                        visit[j] = true
                        break puzzle
                    }
                }
            }
        }
    }
    return cnt
}



func rotateCase(_ r: Int, _ board: [[Int]]) -> [[Int]]{
    switch r{
    case 1:
        return rotate(board)
    case 2:
        return rotate(rotate(board))
    case 3:
        return rotate(rotate(rotate(board)))
    default:
        return board
    }
}

func rotate(_ board: [[Int]]) -> [[Int]]{
    var n_board: [[Int]] = Array(repeating: Array(repeating: 0, count: board.count), count: board.first!.count)
    for r in 0..<board.count{
        for c in 0..<board.first!.count{
            if board[r][c] == 1{
                n_board[c][abs(r - (board.count - 1))] = 1
            }
        }
    }
    return n_board
}


func getBaseTable(_ board: [[(Int,Int)]]) -> [[[Int]]]{
    let board = board
    var result: [[[Int]]] = []
    for i in 0..<board.count{
        let t = board[i]
        let _r = t.max(by: { ($0.0 ) < ($1.0)})!.0
        let _c = t.max(by: { ($0.1) < ($1.1)})!.1
        var base: [[Int]] = Array(repeating: Array(repeating: 0, count: _c + 1), count: _r + 1)
        for j in 0..<board[i].count{
            let (x,y) = board[i][j]
            base[x][y] = 1
        }
        result.append(base)
    }
    return result
}

func bfs(_ board: [[Int]], flag: Bool) -> ([Int],[[(Int,Int)]]){
    var queue: [(Int,Int)] = []
    var visit: [[Bool]] = Array(repeating: Array(repeating: false, count: board.first!.count), count: board.count)
    
    var sizeArr: [Int] = []
    
    var square: Int = 0
    if flag{
        square = 1
    }
    // 하 우 상 좌
    let dx: [Int] = [1,0,-1,0]
    let dy: [Int] = [0,1,0,-1]
    var x_y: [[(Int,Int)]] = []
    
    for r in 0..<board.count{
        for c in 0..<board.first!.count{
            var size: Int = 0
            var xy: [(Int,Int)] = []
            
            if board[r][c] == square && visit[r][c] == false{
                queue.append((r,c))
                visit[r][c] = true
                size += 1
                xy.append((r,c))
            }else{
                continue
            }
            
            while !queue.isEmpty{
                let (x,y) = queue.removeFirst()
                
                for dir in 0..<4{
                    let nx = x + dx[dir]
                    let ny = y + dy[dir]
                    
                    
                    if nx < 0 || nx >= board.count || ny < 0 || ny >= board.first!.count{
                        continue
                    }
                    
                    if board[nx][ny] == square && visit[nx][ny] == false{
                        visit[nx][ny] = true
                        queue.append((nx,ny))
                        xy.append((nx ,ny))
                        size += 1
                    }
                }
            }
            
            xy = xy.map{ (x,y) in return ((x - r),(y - c))}
            
            let mix_y = xy.min(by: { $0.1 < $1.1})
            let t: [(Int,Int)] = xy.map{ arr in
                var a = arr
                a.1 += Int(abs(mix_y!.1))
                return a
            }
            
            
            x_y.append(t)
            
            sizeArr.append(size)
        }
    }
    return (sizeArr,x_y)
}


//let t = solution([[1,1,0,0,1,0],[0,0,1,0,1,0],[0,1,1,0,0,1],[1,1,0,1,1,1],[1,0,0,0,1,0],[0,1,1,1,0,0]]
//                 ,[[1,0,0,1,1,0],[1,0,1,0,1,0],[0,1,1,0,1,1],[0,0,1,0,0,0],[1,1,0,1,1,0],[0,1,0,0,0,0]])
//print(t)



var n_count: Int = 0
var g_board: [[Int]] = []
var removeChikenHouse: Int = 0
var inputBoard: () -> () = {
    let value = readLine()!.split(separator: " ").map{ Int(String($0))! }
    n_count = value.first!
    removeChikenHouse = value.last!
}

func boj_15686(){
    inputBoard()
    var board: [[Int]] = []
    
    var houses: [(Int,Int)] = []
    var chickenHouses: [(Int,Int)] = []
    var combination: [[(Int,Int)]] = []
    
    for _ in 0..<n_count{
        let line = readLine()!.split(separator: " ").map{ Int(String($0))!}
        board.append(line)
    }
    
    for i in 0..<board.count{
        for j in 0..<board.first!.count{
            if board[i][j] == 1{
                houses.append((i + 1, j + 1))
            }else if board[i][j] == 2{
                chickenHouses.append((i + 1, j + 1))
            }
        }
    }
    
    func selectChickenHouse(_ house_ch: [(Int,Int)],select: Int){
        if select == chickenHouses.count{
            if house_ch.count == removeChikenHouse{
                combination.append(house_ch)
            }
            return
        }
        selectChickenHouse(house_ch , select: select + 1)
        selectChickenHouse(house_ch + [chickenHouses[select]], select: select + 1)
    }
    
    selectChickenHouse([],select: 0)
    
    let value = combination
        .map{ coordinator in chickenDistance(chikenHouses: coordinator, houses: houses)}
        .map{ v in v.reduce(0, +) }
        .min()
    
    if let value{
        print(value)
    }
}


func chickenDistance(chikenHouses: [(Int,Int)], houses:[(Int,Int)]) -> [Int]{
    // 0 -> 빈칸 , 1 -> 집 , 2-> 치킨집
    var distances: [Int] = Array(repeating: 500, count: houses.count)
    
    for i in 0..<chikenHouses.count{
        let (r2,c2) = chikenHouses[i]
        for j in 0..<houses.count{
            let (r1,c1) = houses[j]
            let d = abs(r1 - r2) + abs(c1 - c2)
            if distances[j] > d{
                distances[j] = d
            }
        }
    }
    return distances
}
//boj_15686()

var maxBlock: Int = -1000
func boj_2048(){
    //위, 아래, 좌, 우
    inputBoard()
    var board: [[Int]] = []
    for _ in 0..<n_count{
        let line = readLine()!.split(separator: " ").map{ Int(String($0))!}
        board.append(line)
    }
    g_board = board
    
    if n_count == 1{
        print(board.first!.first!)
        return
    }
    recursive(0, g_board)
    print("\(maxBlock)")
}

func recursive(_ index: Int,_ board: [[Int]]){
    
    if index == 5{
        for i in 0..<board.count{
            for j in 0..<board.first!.count{
                maxBlock = maxBlock < board[i][j] ? board[i][j] : maxBlock
            }
        }
        return
    }
    let dir: [Int] = [0,1,2,3]
    
    for d in dir{
        let d_board = combine(d, board: board)
        recursive(index + 1, d_board)
    }
}

func convertOriginal(_ rowORcol: Bool,_ board: [[Int]]) -> [[Int]]{
    var newOne: [[Int]] = []
    var a: Int = board.first!.count
    var b: Int = board.count
    if rowORcol{
        a = board.count
        b = board.first!.count
    }
    for j in 0..<a{
        var one: [Int] = []
        for i in 0..<b{
            one.append(board[i][j])
        }
        newOne.append(one)
    }
    return newOne
}

func combine(_ dir: Int, board: [[Int]]) -> [[Int]]{
    switch dir{
    case 0:
        //상
        let rows = rowArray(board: board).map{ combineRecursive(left: true ,$0, 0,0)}
        return convertOriginal(false,rows)
    case 1:
        //하
        let rows = rowArray(board: board).map{ combineRecursive(left: false ,$0, 0,0)}
        return convertOriginal(false,rows)
    case 2:
        //좌
        return colArray(board: board).map{ combineRecursive(left: true ,$0, 0,0)}
    case 3:
        //우
        return colArray(board: board).map{ combineRecursive(left: false ,$0, 0,0)}
    default:
        print("error")
    }
    return []
}


func combineRecursive(left: Bool,_ arr:[Int],_ index: Int = 0,_ idx: Int = 0) -> [Int] {
    var tmp = Array(repeating: 0, count: arr.count)
    var arr = arr
    var idx = idx
    var index = index
    
    if left == false{
        arr = arr.reversed()
    }
    
    while true{
        if (idx == arr.count - 1) || index == arr.count{
            break
        }
        if arr[index] == 0{
            index += 1
            continue
        }
        
        if tmp[idx] == 0 {
            tmp[idx] = arr[index]
            index += 1
            continue
        }
        if tmp[idx] == arr[index]{
            tmp[idx] = arr[index] * 2
            tmp[index] = 0
            idx += 1
            index += 1
        }else{
            tmp[idx + 1] = arr[index]
            idx += 1
            index += 1
        }
    }
    
    if left == false{
        return tmp.reversed()
    }
    return tmp
}

func colArray(board: [[Int]]) -> [[Int]]{
    var colArray: [[Int]] = []
    let col = board.first!.count
    let row = board.count
    for r in 0..<row{
        var colItem: [Int] = []
        for c in 0..<col{
            colItem.append(board[r][c])
        }
        colArray.append(colItem)
    }
    return colArray
}

func rowArray(board: [[Int]]) -> [[Int]]{
    var rowArray: [[Int]] = []
    let col = board.first!.count
    let row = board.count
    for c in 0..<col{
        var rowItem: [Int] = []
        for r in 0..<row{
            rowItem.append(board[r][c])
        }
        rowArray.append(rowItem)
    }
    return rowArray
}
//boj_2048()
//10
//8 8 4 16 32 0 0 8 8 8
//8 8 4 0 0 8 0 0 0 0
//16 0 0 16 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0 16
//0 0 0 0 0 0 0 0 0 2
//inputBoard()
//var board: [[Int]] = []
//for _ in 0..<n_count{
//    let line = readLine()!.split(separator: " ").map{ Int(String($0))!}
//    board.append(line)
//}
//let t1 = combine(0, board: board)
//let t2 = combine(3, board: t1)
//let t3 = combine(0, board: t2)
//let t4 = combine(3, board: t3)
//let t5 = combine(0, board: t4)
//let t6 = combine(2, board: t5)
//let t7 = combine(2, board: t6)
//t6.forEach{print("\($0)")}
//위,오른,위,오,위,왼,왼

//10
//16 16 8 32 32 0 0 8 8 8
//16 0 0 0 0 8 0 0 0 16
//0 0 0 0 0 0 0 0 0 2
//0 0 0 0 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0 0


//var arr1:[Int] = readLine()!.split(separator: " ").map{ Int(String($0))! }
//let row: Int = arr1[0]
//let col: Int = arr1[1]
//
//var board: [[Int]] = Array(repeating: [], count: row)
//board = board.map { _ in
//    Array(repeating: 0, count: col)
//}
//
//let s_count: Int = arr1[2]
//
//var stickers: [[[Int]]] = []
//
//for _ in 0..<s_count{
//    let s = readLine()!.split(separator: " ").map{ Int(String($0))! }
//    var sticker: [[Int]] = []
//    for _ in 0..<s[0]{
//        let cols = readLine()!.split(separator: " ").map{ Int(String($0))!}
//        sticker.append(cols)
//    }
//    stickers.append(sticker)
//}
//
//// rotate -> 0,1,2,3 ->0,90,180,270
//func stk(stk_index: Int, rotate: Int){
//    if stk_index == stickers.count {
//        return
//    }
//
//    var _sticker = stickers[stk_index]
//
//    switch rotate{
//    case 0:
//        break
//    case 1:
//        _sticker = rotateCheck(insert: _sticker)
//    case 2:
//        _sticker = rotateTwice(insert: _sticker)
//    case 3:
//        _sticker = rotateThird(insert: _sticker)
//    default:
//        return stk(stk_index: stk_index + 1, rotate: 0)
//    }
//
//    for r in 0..<board.count{
//        for c in 0..<board.first!.count{
//            if board[r][c] == 1, _sticker[0][0] == 1{
//                continue
//            }
//            if firstCheck(insert: _sticker, to: (r,c), on: &board){
//                return stk(stk_index: stk_index + 1,rotate: 0)
//            }
//        }
//    }
//    stk(stk_index: stk_index, rotate: rotate + 1)
//}
//
//
//func rotateThird(insert sticker: [[Int]]) -> [[Int]]{
//    return rotateCheck(insert: rotateTwice(insert: sticker))
//}
//func rotateTwice(insert sticker: [[Int]]) -> [[Int]]{
//    return rotateCheck(insert: rotateCheck(insert: sticker))
//}
//
//func rotateCheck(insert sticker: [[Int]]) -> [[Int]]{
//    // 열 -> 행
//    // 행 -> 열
//    var newSticker: [[Int]] = Array(repeating: Array(repeating: 0, count: sticker.count), count: sticker.first!.count)
//    for i in 0..<sticker.count{
//        for j in 0..<sticker.first!.count{
//            if sticker[i][j] == 1{
//                newSticker[j][abs(i - (sticker.count - 1))] = 1
//            }
//        }
//    }
//    return newSticker
//}
//
//func firstCheck(insert sticker: [[Int]],to index: (Int,Int), on board: inout [[Int]]) -> Bool{
//    let (r,c) = index
//    let validRow = r + sticker.count
//    let validCol = c + sticker.first!.count
//    let before = board
//    if validRow > board.count || validCol > board.first!.count{
//        return false
//    }
//
//    for i in r..<validRow{
//        for j in c..<validCol{
//            if sticker[i-r][j-c] == 1{
//                if board[i][j] == 1{
//                    board = before
//                    return false
//                }else{
//                    board[i][j] = 1
//                }
//            }
//        }
//    }
//    return true
//}

//출력 함수
//stk(stk_index: 0, rotate: 0)
//print(board.reduce(0, { result , d in
//    var result = result
//    for i in d{
//        result += i
//    }
//    return result
//}))



//board = Array(repeating: Array(repeating: 0, count: 4), count: 5)
//var stci = [[1,0,1],[1,1,1],[1,0,1]]
//var stci2 = [[0,1],[0,1],[0,1],[1,1],[0,1]]
//
//board.forEach{print($0)}
//firstCheck(insert: stci, to: (0,0), on: &board)
//print("----")
//board.forEach{print($0)}
//print("----")
//firstCheck(insert: stci2, to: (0,2), on: &board)
//board.forEach{print($0)}

//문제
//N개의 정수로 이루어진 수열이 있을 때, 크기가 양수인 부분수열 중에서 그 수열의 원소를 다 더한 값이 S가 되는 경우의 수를 구하는 프로그램을 작성하시오.
//
//입력
//첫째 줄에 정수의 개수를 나타내는 N과 정수 S가 주어진다. (1 ≤ N ≤ 20, |S| ≤ 1,000,000) 둘째 줄에 N개의 정수가 빈 칸을 사이에 두고 주어진다. 주어지는 정수의 절댓값은 100,000을 넘지 않는다.
//
//출력
//첫째 줄에 합이 S가 되는 부분수열의 개수를 출력한다.
//
//예제 입력 1
//5 0
//-7 -3 -2 5 8
//예제 출력 1
//1
let v = readLine()!.split(separator: " ").map{ Int(String($0))!}
let N2 = v[0]
let target = v[1]

let targetArray = readLine()!.split(separator: " ").map { str in Int(String(str))! }
var visit: [Bool] = Array(repeating: false, count: N2)
var cnt = 0

func subsetSum(_ target: Int, num: Int, array: [Int]){
    if num == N2{
        if array.reduce(0, +) == target{
            cnt += 1
        }
        return
    }
    subsetSum(target, num: num + 1, array: array + [targetArray[num]])
    subsetSum(target, num: num + 1, array: array )
}
//subsetSum(target, num: 0, array: [])
//
//if target == 0{
//    print(cnt-1)
//}else{
//    print(cnt)
//}


//문제
//N-Queen 문제는 크기가 N × N인 체스판 위에 퀸 N개를 서로 공격할 수 없게 놓는 문제이다.
//
//N이 주어졌을 때, 퀸을 놓는 방법의 수를 구하는 프로그램을 작성하시오.
//
//입력
//첫째 줄에 N이 주어진다. (1 ≤ N < 15)
//
//출력
//첫째 줄에 퀸 N개를 서로 공격할 수 없게 놓는 경우의 수를 출력한다.
//2(n - 1) + 1 좌측,우측 상단
let N = v.first!
let line = 2*(N - 1) + 1

var issued_col: [Bool] = Array(repeating: true, count: N)
// x - y + n - 1
var issued_right: [Bool] = Array(repeating: true, count: line) // 우측 상단
// x + y
var issued_left: [Bool] = Array(repeating: true, count: line) // 좌측 상단
//var chessBoard:
var count: Int = 0
func queen(row: Int, N: Int){
    if row == N{
        count += 1
        return
    }
    for c in 0..<N{
        let issuedLeft = row + c
        let issuedRight = row - c + N - 1
        if check(c: c, left: issuedLeft, right: issuedRight){
            insert_queen_on_board(c: c, left: issuedLeft, right: issuedRight)
            queen(row: row + 1, N: N)
            out_queen_on_board(c: c, left: issuedLeft, right: issuedRight)
        }
    }
}

func insert_queen_on_board(c: Int, left: Int, right: Int){
    issued_col[c] = false
    issued_left[left] = false
    issued_right[right] = false
}

func out_queen_on_board(c: Int, left: Int, right: Int){
    issued_col[c] = true
    issued_left[left] = true
    issued_right[right] = true
}

func check(c: Int, left: Int, right: Int) -> Bool{
    if issued_col[c] == true,
       issued_left[left] == true,
       issued_right[right] == true{
        return true
    }else{
        return false
    }
}

//queen(row: 0, N: N)
//print("\(count)")


//4 1
//1,2,3,4
func nAndm(N: [Int], M: Int, target: [Int]){
    if target.count == M{
        let str = target.map { num in
            String(num)
        }.joined(separator: " ")
        print(str)
        return
    }
    for i in 0..<N.count{
        if target.contains(N[i]){ continue }
        let t = target + [ N[i] ]
        nAndm(N: N, M: M, target: t)
    }
}
var arr: [Int] = []
for i in 1..<(v[0] + 1){
    arr.append(i)
}
//nAndm(N: arr, M: v[1], target: [])


func zetfunc(N: Int, r: Int, c: Int) -> Int{
    if N == 1{
        if r == 0 , c == 0{
            return 0
        }else if r == 0,c == 1{
            return 1
        }else if r == 1,c == 0{
            return 2
        }else {
            return 3
        }
    }
    
    let half = 1 << (N - 1)
    
    if (r < half && r >= 0) && ( c < half && c >= 0){
        // 1사분면
        return zetfunc(N: N - 1, r: r % half, c: c % half)
    }else if (r < half && c >= half){
        // 2사분면
        return (half * half) + zetfunc(N: N - 1, r: r % half, c: c % half)
    }else if (r >= half && c < half){
        //3 사분면
        return 2*(half * half) + zetfunc(N: N - 1, r: r % half, c: c )
    }else {
        //(r >= half && c >= half)
        // 4 사분면
        return 3 * (half * half) + zetfunc(N: N - 1, r: r % half, c: c % half)
    }
}


//
//func hanoitop(from a: Int, to b: Int, _ n: Int){
//    if n == 1{
//        print("\(a) \(b)")
//        return
//    }
//    hanoitop(from: a, to: 6 - a - b, n - 1)
//    print("\(a) \(b)")
//    hanoitop(from: 6 - a - b, to: b, n - 1)
//}
//
//let n = v.first!
//print("\(1 << n - 1)")
//hanoitop(from: 1, to: 3, n)

//func doubleInteger(_ a : Int, _ b: Int, _ m: Int) -> Int{
//    if b == 1 {
//        return a % m
//    }
//    var value = doubleInteger(a, b/2, m)
//    value = value * value % m
//    if b % 2 == 0 { return value}
//    else { return (value * a % m)}
//}
//let t = doubleInteger(v[0], v[1], v[2])
//print(t)
//5 4
//####
//#JF#
//#..#
//#..#
//####
//IMPOSSIBLE


final class Queue<T> {
    private var inArr: [T] = []
    private var outArr: [T] = []
    
    var isEmpty: Bool {
        inArr.isEmpty && outArr.isEmpty
    }
    
    func enqueue(_ element: T) {
        inArr.append(element)
    }
    
    func dequeue() -> T? {
        if outArr.isEmpty {
            outArr = inArr.reversed()
            inArr.removeAll(keepingCapacity: true)
        }
        return outArr.popLast()
    }
}

var board2: [[Character]] = []
//하 우 상 좌
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]

// N -> 행 , M -> 열
let value = readLine()!
let e: [Int] = value.split(separator: " ").map{ Int(String($0))! }
let subin = e.first!
let dongSang = e.last!

func solution() -> Int?{
    let N = 100000
    let mX: [Int] = [1,-1]
    var map: [Int] = Array(repeating: -1, count: N + 1)
    var visit: [Bool] = Array(repeating: false, count: N + 1)
    
    
    map[subin] = 0
    
    map[dongSang] = -2
    
    let queue = Queue<Int>()
    queue.enqueue(subin)
    
    while !queue.isEmpty{
        let x = queue.dequeue()!
        for i in 0..<3{
            var nX = 0
            if i == 2{
                nX = 2 * x
            }else {
                nX = x + mX[i]
            }
            if nX < 0 || nX > N {
                continue
            }
            if (map[nX] != -1 && map[nX] != -2) || visit[nX] == true{
                continue
            }
            if map[nX] == -2{
                return map[x] + 1
            }
            visit[nX] = true
            map[nX] = map[x] + 1
            queue.enqueue(nX)
        }
    }
    return nil
}
let s = solution()!
print(s)




//var map: [[Int]] = Array(repeating: [], count: row)




//
//for i in 0 ..< row {
//    map[i] = readLine()!.map { s in
//        if s == "#" {
//            return -3
//        } else if s == "J" {
//            return 1001
//        } else if s == "F" {
//            return 0
//        } else {
//            return -1
//        }
//    }
//}
//
//var N:Int = map.count
//var M:Int = map.first!.count
//
//var room: [[Int]] = Array(repeating: Array(repeating: -10, count: M), count: N)
//var fireMap: [[Int]] = Array(repeating: Array(repeating: -100, count: M), count: N)
//
//var jihun: (Int,Int) = (-1,-1)
//var fires: [(Int,Int)] = []
//var ret: Int = 0
//
//func solution(){
//    for i in 0..<N{
//        for j in 0..<M{
//            if map[i][j] == 1001{
//                jihun = (i,j)
//            }else if map[i][j] == 0{
//                fires.append((i,j))
//            }
//        }
//    }
//
//    let queue = Queue<(x: Int, y: Int)>()
//    fires.forEach { x,y in
//        fireMap[x][y] = 0
//        queue.enqueue((x,y))
//    }
//
//    while !queue.isEmpty{
//        let (x,y) = queue.dequeue()!
//
//        for dir in 0..<4{
//            let nx = x + dx[dir]
//            let ny = y + dy[dir]
//
//            if nx < 0 || nx >= N || ny < 0 || ny >= M{
//                continue
//            }
//            guard map[nx][ny] != -3 && fireMap[nx][ny] == -100 else { continue }
//            fireMap[nx][ny] = fireMap[x][y] + 1
//            queue.enqueue((nx,ny))
//        }
//    }
//
//    queue.enqueue(jihun)
//    room[jihun.0][jihun.1] = 0
//    while !queue.isEmpty{
//        let (x,y) = queue.dequeue()!
//
//        for dir in 0..<4{
//            let nx = x + dx[dir]
//            let ny = y + dy[dir]
//
//            if nx < 0 || nx >= N || ny < 0 || ny >= M{
//                ret = room[x][y] + 1
//                return
//            }
//            guard map[nx][ny] != -3 && room[nx][ny] == -10 else { continue }
//            if fireMap[nx][ny] <= room[x][y] + 1 && fireMap[nx][ny] != -100 {
//                continue
//            }
//            room[nx][ny] = room[x][y] + 1
//            queue.enqueue((nx,ny))
//        }
//    }
//}
//
////solution()
//if ret <= 0 {
//    print("IMPOSSIBLE")
//}else{
//    print(ret)
//}










//var visit: [[Bool]] = []
//
//func tommiato(){
//    inputBoard()
//    N = board2.count
//    M = board2.first!.count
//
//    var init_fireTomato: [(Int,Int)] = []
//    var queue: [(Int,Int)] = []
//    var head: Int = 0
//    var minus: Int = 0
//
//    for i in 0..<N{
//        for j in 0..<M{
//            if board2[i][j] == 1{
//                init_fireTomato.append((i,j))
//                queue.append((i,j))
//            }else if board2[i][j] != 0 {
//                minus += 1
//            }
//        }
//    }
//
//    var zeroCount = (N*M) - (init_fireTomato.count + minus)
//
//    if init_fireTomato.count == 0 {
//        print(-1)
//        return
//    }else if init_fireTomato.count == (N*M) || zeroCount == 0{
//        print(0)
//        return
//    }
//
//    var day = -1000
//
//    while head < queue.count {
//        let (x,y) = queue[head]
//        head += 1
//        for dir in 0..<4{
//            let nx: Int = x + dx[dir]
//            let ny: Int = y + dy[dir]
//
//            if nx < 0 || nx >= N || ny < 0 || ny >= M{
//                continue
//            }
//            if board2[nx][ny] != 0 {
//                continue
//            }
//            zeroCount -= 1
//            board2[nx][ny] = board2[x][y] + 1
//            queue.append((nx,ny))
//
//            day = day < board2[nx][ny] ? board2[nx][ny] : day
//        }
//    }
//
//    if zeroCount != 0{
//        print(-1)
//    }else if day < 0 {
//        print(0)
//    }else{
//        print(day - 1)
//    }
//}
//
//
//func boj2178(){
//    inputBoard()
//    N = board2.count
//    M = board2.first!.count
//
//    for i in 0..<N{
//        for j in 0..<M{
//            if board2[i][j] == 1 {
//                board2[i][j] = -1
//            }
//        }
//    }
//
//    var queue: [(Int,Int)] = []
//    let distance: Int = 1
//
//    if board2[0][0] == -1{
//        board2[0][0] = distance
//        queue.append((0,0))
//    }
//
//    while !queue.isEmpty{
//        let (x,y) = queue.removeFirst()
//
//        for dir in 0..<4{
//            let nx = x + dx[dir]
//            let ny = y + dy[dir]
//
//            if nx < 0 || nx >= N || ny < 0 || ny >= M{
//                continue
//            }
//
//            if ((board2[nx][ny] >= 0) || board2[nx][ny] != -1 ){
//                continue
//            }
//            board2[nx][ny] = board2[x][y] + 1
//            queue.append((nx,ny))
//        }
//    }
//    print(board2[N-1][M-1])
//}
////boj2178()
//
////4 6
////110110
////110110
////111111
////111101
//
//func solution(){
//    inputBoard()
//
//    N = board2.count
//    M = board2.first!.count
//
//    var max: Int = 0
//    var count: Int = 0
//
//    for i in 0..<N{
//        for j in 0..<M{
//            let (x,y) = (i,j)
//            if ((visit[x][y] == true) || (board2[x][y] == 0)){
//                continue
//            }
//            let value = bfs((x,y), board2)
//            count += 1
//            max = max > value ? max : value
//        }
//    }
//    print(count)
//    print(max)
//}
//
//
//func bfs(_ tuple: (Int,Int),_ board: [[Int]]) -> Int{
//    let x = tuple.0
//    let y = tuple.1
//    var queue: [(Int,Int)] = []
//    visit[x][y] = true
//    queue.append((x,y))
//    var size: Int = 0
//    while !queue.isEmpty{
//        size += 1
//        let (_x,_y) = queue.removeFirst()
//        for i in 0..<4{
//            let posX = _x + dx[i]
//            let posY = _y + dy[i]
//
//            if posX < 0 || posX >= N || posY < 0 || posY >= M {
//                continue
//            }
//            if (visit[posX][posY] == true) || (board[posX][posY] != 1){
//                continue
//            }
//            visit[posX][posY] = true
//            queue.append((posX,posY))
//        }
//    }
//    return size
//}
//
////solution()
//
////6 5
////1 1 0 1 1
////0 1 1 0 0
////0 0 0 0 0
////1 0 1 1 1
////0 0 1 1 1
////0 0 1 1 1
//
//
////4
////9
//
//
////// 1 ->.  4가지경우
////// 2 2방향 2가지경우
////// 3 직각 4가지경우
////// 4 세방향 4가지경우
////// 5 모든방향 1가지경우
////
//////첫째 줄에 사무실의 세로 크기 N과 가로 크기 M이 주어진다. (1 ≤ N, M ≤ 8)
//////
//////둘째 줄부터 N개의 줄에는 사무실 각 칸의 정보가 주어진다. 0은 빈 칸, 6은 벽, 1~5는 CCTV를 나타내고, 문제에서 설명한 CCTV의 종류이다.
//////
//////CCTV의 최대 개수는 8개를 넘지 않는다.
////
//////4 6
//////0 0 0 0 0 0
//////0 0 0 0 0 0
//////0 0 1 0 6 0
//////0 0 0 0 0 0
////
////// 6 은 벽이다.
////
//
////var board2: [[String]] = []
////var squareZone: Int = Int.max
////    //x -> 행, y -> 열    //하 우 상 좌
////let dx: [Int] = [1,0,-1,0]
////let dy: [Int] = [0,1,0,-1]
////
////var cctvList: [(value: Int,x: Int,y: Int)] = []
////var zerovalue: Int = 0
////var inputBoard: () -> ()  = {
////    if let value = readLine() {
////        let e: [Int] = value.split(separator: " ").map{ Int(String($0))! }
////        let row = e.first!
////        for _ in 0..<row{
////            if let value = readLine(){
////                let str = value.split(separator: " ").map{String($0)}
////                board2.append(str)
////            }
////        }
////    }
////}
////
////func getCCTVList(){
////    for i in 0..<board2.count{
////        for j in 0..<board2.first!.count{
////            if let cctv = Int(board2[i][j]),
////             ((1 <= cctv) && (cctv <= 5)) {
////                cctvList.append((cctv,i,j))
////            }else if Int(board2[i][j]) == 0{
////                zerovalue += 1
////            }
////        }
////    }
////}
////
////func isValidValue(position: (Int,Int)) -> Bool{
////    let (x,y) = position
////    return (0 <= x && x <= board2.count - 1 && 0 <= y && y <= board2.first!.count - 1) && (board2[x][y] != "6")
////}
////
////func searchZeroValue(_ board: inout [[String]],_ position: (Int,Int), _ dir: Int) -> Int{
////    var posX = position.0 + dx[dir]
////    var posY = position.1 + dy[dir]
////
////    var cont: Int = 0
////
////    while isValidValue(position: (posX,posY)){
////        if board[posX][posY] == "0"{
////            board[posX][posY] = "#"
////            cont += 1
////        }
////        posX += dx[dir]
////        posY += dy[dir]
////    }
////    return cont
////}
////
////func activieCCTV(board: inout [[String]], position: (Int,Int), dir: Int, cctvIndex: Int) -> Int{
////    var notSharpValue: Int = 0 //not # count
////
////    switch cctvIndex{
////    case 1:
////        notSharpValue += searchZeroValue(&board, position, dir)
////    case 2:
////        [0,2].forEach { dirPlus in
////            notSharpValue += searchZeroValue(&board, position, (dir + dirPlus) % 4)
////        }
////    case 3:
////        (0...1).forEach { dirPlus in
////            notSharpValue += searchZeroValue(&board, position, (dir + dirPlus) % 4)
////        }
////    case 4:
////        (0...2).forEach { dirPlus in
////            notSharpValue += searchZeroValue(&board, position, (dir + dirPlus) % 4)
////        }
////    case 5:
////        (0...3).forEach { dirPlus in
////            notSharpValue += searchZeroValue(&board, position, (dir + dirPlus) % 4)
////        }
////    default:
////        assert(false,"bad Board value")
////    }
////    return notSharpValue
////}
////
////func dfs(index: Int, value: Int, board: [[String]]){
////    if index >= cctvList.count{
////        let valu23e = zerovalue - value
////        squareZone = squareZone > valu23e ? valu23e : squareZone
////        if squareZone == 2{
////            print(board)
////        }
////        return
////    }
////
////    var nBoard = board
////    let cctv = cctvList[index]
////    for dir in 0..<4{
////        let cctvPosition = (cctv.x, cctv.y)
////        let num = cctv.value
////        let notSharp = activieCCTV(board: &nBoard, position: cctvPosition, dir: dir, cctvIndex: num)
////        dfs(index: index + 1, value: value + notSharp, board: nBoard)
////        nBoard = board
////    }
////}
////
////
////inputBoard()
////getCCTVList()
////dfs(index: 0, value: 0, board: board2)
////print("\(squareZone)")
//
//
//
//
//
////
////if let value = readLine() {
////    let e: [Int] = value.split(separator: " ").map{ Int(String($0))! }
////    let row = e.first!
////    var visited: [[Bool]] = []
////    for _ in 0..<row{
////        if let value = readLine(){
////            let str = value.split(separator: " ").map{String($0)}
////
////            board.append(str)
////            visited.append(str.map{ _ in return false})
////        }
////    }
//
////    dfs(rowIndex: 0, colIndex: 0)
////
////    print("\(squareZone)")
////
////    func dfs(rowIndex: Int, colIndex: Int){
////
////        if (rowIndex == (board.count - 1) && colIndex > (board.first!.count - 1)){
////            var zone: Int = 0
////            board.forEach { row in
////                row.forEach { col in
////                    if col == "0" {
////                        zone += 1
////                    }
////                }
////            }
////            squareZone = min(squareZone, zone)
////            return
////        }
////
////        var row: Int = rowIndex
////        var col: Int = 0
////        if (colIndex == (board.first!.count - 1) && rowIndex != board.count - 1){
////            row += 1
////            col = 0
////        }else{
////            col = colIndex + 1
////        }
////
////        let cctv = Int(board[rowIndex][colIndex])
////
////        switch cctv{
////        case 1:
////            let before = board
////            changeUp(current: rowIndex, columm: colIndex)
////            dfs(rowIndex: row , colIndex: col)
////            board = before
////
////            let before2 = board
////            changeLeft(current: rowIndex, columm: colIndex)
////            dfs(rowIndex: row , colIndex: col)
////            board = before2
////
////            let before3 = board
////            changeRight(current: rowIndex, columm: colIndex)
////            dfs(rowIndex: row , colIndex: col)
////            board = before3
////
////            let before4 = board
////            dfs(rowIndex: row , colIndex: col)
////            board = before4
////        case 2:
////            let before1 = board
////            changeUp(current: rowIndex, columm: colIndex)
////            changeDown(current: rowIndex, columm: colIndex)
////            dfs(rowIndex: row, colIndex: col)
////            board = before1
////
////            let before2 = board
////            changeLeft(current: rowIndex, columm: colIndex)
////            changeRight(current: rowIndex, columm: colIndex)
////            dfs(rowIndex: row, colIndex: col)
////            board = before2
////        case 3:
////            let before = board
////            changeUp(current: rowIndex, columm: colIndex)
////            changeLeft(current: rowIndex, columm: colIndex)
////            dfs(rowIndex: row, colIndex: col)
////            board = before
////
////            let before1 = board
////            changeUp(current: rowIndex, columm: colIndex)
////            changeRight(current: rowIndex, columm: colIndex)
////            dfs(rowIndex: row, colIndex: col)
////            board = before1
////
////            let before2 = board
////            changeDown(current: rowIndex, columm: colIndex)
////            changeRight(current: rowIndex, columm: colIndex)
////            dfs(rowIndex: row, colIndex: col)
////            board = before2
////
////            let before3 = board
////            changeDown(current: rowIndex, columm: colIndex)
////            changeLeft(current: rowIndex, columm: colIndex)
////            dfs(rowIndex: row, colIndex: col)
////            board = before3
////
////        case 4:
////            let before = board
////            changeThreeDirectionUP(current: rowIndex, columm: colIndex)
////            dfs(rowIndex: row, colIndex: col)
////            board = before
////
////            let before2 = board
////            changeThreeDirectionLeft(current: rowIndex, columm: colIndex)
////            dfs(rowIndex: row, colIndex: col)
////            board = before2
////
////
////            let before3 = board
////            changeThreeDirectionRight(current: rowIndex, columm: colIndex)
////            dfs(rowIndex: row, colIndex: col)
////            board = before3
////
////            let before4 = board
////            changeThreeDirectionDown(current: rowIndex, columm: colIndex)
////            dfs(rowIndex: row, colIndex: col)
////            board = before4
////        case 5:
////            changeAllDirection(current: rowIndex, columm: colIndex)
////            dfs(rowIndex: row, colIndex: col)
////        default:
////            dfs(rowIndex: row, colIndex: col)
////        }
////
////    }// bfs
////
////    func changeAllDirection(current row: Int,columm: Int,_ original: Bool = false){
////        changeUp(current: row, columm: columm, original)
////        changeLeft(current: row, columm: columm, original)
////        changeRight(current: row, columm: columm, original)
////        changeDown(current: row, columm: columm,original)
////    }
////
////    func changeThreeDirectionUP(current row: Int,columm: Int,_ original: Bool = false){
////        changeUp(current: row, columm: columm, original)
////        changeLeft(current: row, columm: columm, original)
////        changeRight(current: row, columm: columm, original)
////    }
////
////    func changeThreeDirectionLeft(current row: Int,columm: Int,_ original: Bool = false){
////        changeUp(current: row, columm: columm, original)
////        changeLeft(current: row, columm: columm, original)
////        changeDown(current: row, columm: columm, original)
////    }
////    func changeThreeDirectionRight(current row: Int,columm: Int,_ original: Bool = false){
////        changeUp(current: row, columm: columm, original)
////        changeRight(current: row, columm: columm, original)
////        changeDown(current: row, columm: columm, original)
////    }
////    func changeThreeDirectionDown(current row: Int,columm: Int,_ original: Bool = false){
////        changeDown(current: row, columm: columm, original)
////        changeLeft(current: row, columm: columm, original)
////        changeRight(current: row, columm: columm, original)
////    }
////
////    func changeRight(current row: Int,columm: Int,_ original: Bool = false){
////        if original{
////            for i in (columm + 1)..<board.first!.count{
////                if board[row][i] == "#"{
////                    board[row][i] = "0"
////                }
////
////                if (board[row][i] == "6"){
////                    break
////                }
////            }
////        }else{
////            for i in (columm + 1)..<board.first!.count{
////                if board[row][i] == "0"{
////                    board[row][i] = "#"
////                }
////                if board[row][i] == "6"{
////                    break
////                }
////            }
////        }
////    }
////
////    func changeLeft(current row: Int,columm: Int,_ original: Bool = false){
////        if original{
////            for i in stride(from: columm - 1, to: -1, by: -1){
////                if board[row][i] == "#"{
////                    board[row][i] = "0"
////                }
////                if board[row][i] == "6"{
////                    break
////                }
////            }
////        }else{
////            for i in stride(from: columm - 1, to: -1, by: -1){
////                if board[row][i] == "0"{
////                    board[row][i] = "#"
////                }
////                if board[row][i] == "6"{
////                    break
////                }
////            }
////        }
////    }
////
////    func changeUp(current row: Int,columm: Int,_ original: Bool = false){
////        if original{
////            for i in stride(from: row - 1, to: -1, by: -1){
////                if board[i][columm] == "#"{
////                    board[i][columm] = "0"
////                }
////                if board[i][columm] == "6"{
////                    break
////                }
////            }
////        }else{
////            for i in stride(from: row - 1, to: -1, by: -1){
////                if board[i][columm] == "0"{
////                    board[i][columm] = "#"
////                }
////                if board[i][columm] == "6"{
////                    break
////                }
////            }
////        }
////    }
////
////    func changeDown(current row: Int,columm: Int,_ original: Bool = false){
////        if original{
////            for i in (row + 1)..<board.count{
////                if board[i][columm] == "#"{
////                    board[i][columm] = "0"
////                }
////                if board[i][columm] == "6"{
////                    break
////                }
////            }
////        }else{
////            for i in (row + 1)..<board.count{
////                if board[i][columm] == "0"{
////                    board[i][columm] = "#"
////                }
////
////                if board[i][columm] == "6"{
////                    break
////                }
////            }
////        }
////    }
////}
////
////
////
////
