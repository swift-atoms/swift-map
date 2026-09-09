import Map
import Testing

@Suite
struct `Map transforms values independently` {

    @Test
    func `a standalone map preserves typed failure`() {
        let map = Map::Map<Int, String, Rejected> { value throws(Rejected) in
            guard value >= 0 else { throw .negative }
            return String(value)
        }
        do throws(Rejected) {
            #expect(try map(42) == "42")
            _ = try map(-1)
            Issue.record("Expected rejection")
        } catch {
            #expect(error == .negative)
        }
    }

    @Test
    func `a standalone map carries a scoped result`() {
        let map = Map::Map<Span<Int>, Span<Int>, Never> {
            (source: consuming Span<Int>) in source
        }
        let values = [10, 20]
        let result = map(values.span)
        #expect(result[0] == 10)
        #expect(result[1] == 20)
    }

    private enum Rejected: Swift.Error { case negative }
}
