class Foo {
    var test: Int {
        get {

        }
        set {

        }
    }
}

struct S {
    public var someValue: Int
        {
          return 0
        }
}

// RUN: %sourcekitd-test -req=format -line=1 -length=1 %s >%t.response
// RUN: %sourcekitd-test -req=format -line=2 -length=1 %s >>%t.response
// RUN: %sourcekitd-test -req=format -line=3 -length=1 %s >>%t.response
// RUN: %sourcekitd-test -req=format -line=4 -length=1 %s >>%t.response
// RUN: %sourcekitd-test -req=format -line=5 -length=1 %s >>%t.response
// RUN: %sourcekitd-test -req=format -line=6 -length=1 %s >>%t.response
// RUN: %sourcekitd-test -req=format -line=7 -length=1 %s >>%t.response
// RUN: %sourcekitd-test -req=format -line=8 -length=1 %s >>%t.response
// RUN: %sourcekitd-test -req=format -line=9 -length=1 %s >>%t.response
// RUN: %sourcekitd-test -req=format -line=10 -length=1 %s >>%t.response
// RUN: %sourcekitd-test -req=format -line=14 -length=1 %s >>%t.response
// RUN: %sourcekitd-test -req=format -line=15 -length=1 %s >>%t.response
// RUN: %sourcekitd-test -req=format -line=16 -length=1 %s >>%t.response
// RUN: FileCheck --strict-whitespace %s <%t.response

// CHECK: key.sourcetext: "class Foo {"
// CHECK: key.sourcetext: "    var test: Int {"
// CHECK: key.sourcetext: "        get {"
// CHECK: key.sourcetext: "            "
// CHECK: key.sourcetext: "        }"
// CHECK: key.sourcetext: "        set {"
// CHECK: key.sourcetext: "            "
// CHECK: key.sourcetext: "        }"
// CHECK: key.sourcetext: "    }"
// CHECK: key.sourcetext: "}"
//                        "    public var someValue: Int"
// CHECK: key.sourcetext: "    {"
// CHECK: key.sourcetext: "        return 0"
// CHECK: key.sourcetext: "    }"
