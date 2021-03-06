// RUN: not llvm-mc -triple=aarch64 -show-encoding -mattr=+sve  2>&1 < %s| FileCheck %s

// --------------------------------------------------------------------------//
// Invalid immediate (in range [0, 63]).

ld1rsb z0.h, p1/z, [x0, #-1]
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: index must be in range [0, 63].
// CHECK-NEXT: ld1rsb z0.h, p1/z, [x0, #-1]
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

ld1rsb z0.h, p1/z, [x0, #64]
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: index must be in range [0, 63].
// CHECK-NEXT: ld1rsb z0.h, p1/z, [x0, #64]
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:


// --------------------------------------------------------------------------//
// Invalid result vector element size

ld1rsb z0.b, p1/z, [x0]
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: invalid operand
// CHECK-NEXT: ld1rsb z0.b, p1/z, [x0]
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:


// --------------------------------------------------------------------------//
// restricted predicate has range [0, 7].

ld1rsb z0.h, p8/z, [x0]
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: restricted predicate has range [0, 7].
// CHECK-NEXT: ld1rsb z0.h, p8/z, [x0]
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:
