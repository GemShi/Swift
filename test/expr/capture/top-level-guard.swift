// RUN: %target-swift-frontend -dump-ast %s 2>&1 | FileCheck %s
// RUN: %target-swift-frontend -emit-ir %s > /dev/null

// CHECK: (top_level_code_decl
// CHECK: (guard_stmt
guard let x = Optional(0) else { fatalError() }

// CHECK: (top_level_code_decl
_ = 0 // intervening code

// CHECK-LABEL: (func_decl "function()" type='() -> ()' access=internal captures=(x<direct>)
func function() {
  _ = x
}

// CHECK-LABEL: (closure_expr
// CHECK: location={{.*}}top-level-guard.swift:[[@LINE+3]]
// CHECK: captures=(x<direct>)
// CHECK: (var_decl "closure"
let closure: () -> Void = {
  _ = x
}

// CHECK-LABEL: (capture_list
// CHECK: location={{.*}}top-level-guard.swift:[[@LINE+5]]
// CHECK: (closure_expr
// CHECK: location={{.*}}top-level-guard.swift:[[@LINE+3]]
// CHECK: captures=(x)
// CHECK: (var_decl "closureCapture"
let closureCapture: () -> Void = { [x] in
  _ = x
}

// CHECK-LABEL: (defer_stmt
// CHECK-NEXT: (func_decl implicit "$defer()" type='() -> ()' access=private captures=(x<direct><noescape>)
defer {
  _ = x
}