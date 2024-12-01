import Foundation

func main() {
    let fileURL = Bundle.module.url(forResource: "Resources/input", withExtension: nil)!
    do {
        let input = try String(contentsOf: fileURL, encoding: .utf8)
        let lines = input.components(separatedBy: .newlines)

        var pairs: [(Int, Int)] = []
        for line in lines {
            let components = line.split(separator: " ")
            pairs.append((Int(components[0])!, Int(components[1])!))
        }

        let col1 = pairs.map { $0.0 }.sorted()
        let col2 = pairs.map { $0.1 }.sorted()

        var answer = 0
        for i in 0..<col1.count {
            let distance = abs(col1[i] - col2[i])
            answer += distance
        }

        print("Answer task: \(answer)")
    } catch {
        print("Error reading file: \(error)")
    }
}

main()