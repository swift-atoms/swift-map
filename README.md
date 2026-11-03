# swift-map

Use this package when you need a transformation from one value to another as a value you can store and pass around: it consumes its source, may fail with one typed error, and works for noncopyable and nonescapable sources and targets, including a target whose lifetime is scoped to the source (a `Span` in, a `Span` out). Start from `Map<Source, Target, Failure>`. If the transformation only needs to borrow its source, use the sibling package swift-contramap instead. If it returns a continuation to chain into rather than a final value, use the sibling package swift-flatmap.
