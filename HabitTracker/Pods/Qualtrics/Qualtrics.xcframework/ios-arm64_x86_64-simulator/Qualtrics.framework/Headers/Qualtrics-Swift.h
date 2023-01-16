#if 0
#elif defined(__arm64__) && __arm64__
// Generated by Apple Swift version 5.5.1 (swiftlang-1300.0.31.4 clang-1300.0.29.6)
#ifndef QUALTRICS_SWIFT_H
#define QUALTRICS_SWIFT_H
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <Foundation/Foundation.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(ns_consumed)
# define SWIFT_RELEASES_ARGUMENT __attribute__((ns_consumed))
#else
# define SWIFT_RELEASES_ARGUMENT
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif
#if !defined(SWIFT_RESILIENT_CLASS)
# if __has_attribute(objc_class_stub)
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME) __attribute__((objc_class_stub))
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_class_stub)) SWIFT_CLASS_NAMED(SWIFT_NAME)
# else
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME)
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) SWIFT_CLASS_NAMED(SWIFT_NAME)
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_WEAK_IMPORT)
# define SWIFT_WEAK_IMPORT __attribute__((weak_import))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if !defined(IBSegueAction)
# define IBSegueAction
#endif
#if __has_feature(modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import CoreGraphics;
@import Foundation;
@import ObjectiveC;
@import UIKit;
@import WebKit;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="Qualtrics",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

typedef SWIFT_ENUM(NSInteger, CreativeType, open) {
  CreativeTypeNotification = 0,
  CreativeTypePopOver = 1,
  CreativeTypeEmbeddedFeedback = 2,
};

@class NSString;
@class NSNumber;

SWIFT_CLASS("_TtC9Qualtrics20InitializationResult")
@interface InitializationResult : NSObject
- (NSString * _Nullable)getMessage SWIFT_WARN_UNUSED_RESULT;
- (BOOL)passed SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end

@class QualtricsProperties;
@class QualtricsWebviewTheme;
@class TargetingResult;
@class UNNotificationResponse;
@class UIViewController;
@class UILocalNotification;

SWIFT_CLASS("_TtC9Qualtrics9Qualtrics")
@interface Qualtrics : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) Qualtrics * _Nonnull shared;)
+ (Qualtrics * _Nonnull)shared SWIFT_WARN_UNUSED_RESULT;
@property (nonatomic, readonly, strong) QualtricsProperties * _Nonnull properties;
@property (nonatomic, strong) QualtricsWebviewTheme * _Nonnull webviewTheme;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
- (void)initializeWithBrandId:(NSString * _Nonnull)brandId zoneId:(NSString * _Nonnull)zoneId interceptId:(NSString * _Nonnull)interceptId completion:(void (^ _Nullable)(InitializationResult * _Nonnull))completion SWIFT_DEPRECATED_MSG("This is being removed; please migrate to initializeProject.");
- (void)initializeProjectWithBrandId:(NSString * _Nonnull)brandId projectId:(NSString * _Nonnull)projectId extRefId:(NSString * _Nullable)extRefId completion:(void (^ _Nullable)(NSDictionary<NSString *, InitializationResult *> * _Nonnull))completion;
- (void)evaluateTargetingLogicWithCompletion:(void (^ _Nonnull)(TargetingResult * _Nonnull))completion SWIFT_DEPRECATED_MSG("This is being removed; please migrate to evaluateProject or evaluateIntercept.");
- (void)evaluateProjectWithCompletion:(void (^ _Nonnull)(NSDictionary<NSString *, TargetingResult *> * _Nonnull))completion;
- (void)evaluateInterceptFor:(NSString * _Nonnull)interceptId completion:(void (^ _Nonnull)(TargetingResult * _Nonnull))completion;
- (BOOL)handleLocalNotificationWithResponse:(UNNotificationResponse * _Nonnull)response displayOn:(UIViewController * _Nonnull)viewController SWIFT_WARN_UNUSED_RESULT SWIFT_AVAILABILITY(ios,introduced=10.0);
- (BOOL)handleLocalNotification:(UILocalNotification * _Nonnull)notification displayOn:(UIViewController * _Nonnull)viewController SWIFT_WARN_UNUSED_RESULT;
- (BOOL)displayWithViewController:(UIViewController * _Nonnull)viewController autoCloseSurvey:(NSNumber * _Nonnull)autoCloseSurvey SWIFT_WARN_UNUSED_RESULT;
- (BOOL)displayInterceptFor:(NSString * _Nonnull)interceptID viewController:(UIViewController * _Nonnull)viewController autoCloseSurvey:(NSNumber * _Nonnull)autoCloseSurvey SWIFT_WARN_UNUSED_RESULT;
- (void)displayTargetWithTargetViewController:(UIViewController * _Nonnull)targetViewController targetUrl:(NSString * _Nonnull)targetUrl autoCloseSurvey:(NSNumber * _Nonnull)autoCloseSurvey;
- (NSArray<NSString *> * _Nonnull)getInitializedIntercepts SWIFT_WARN_UNUSED_RESULT;
- (NSArray<NSString *> * _Nonnull)getPassingIntercepts SWIFT_WARN_UNUSED_RESULT;
- (void)setEmbeddedFeedbackDialogCloseListenerWithListener:(void (^ _Nullable)(void))listener;
- (BOOL)hide SWIFT_WARN_UNUSED_RESULT;
- (void)registerViewVisitWithViewName:(NSString * _Nonnull)viewName;
- (void)resetTimer;
- (void)resetViewCounter;
/// Returns the q_touchpoint value for the given intercept
/// If the given intercept has not been initialized and evaluated, this function will return a nil value.
- (NSString * _Nullable)getQualtricsContactIdWithInterceptId:(NSString * _Nonnull)interceptId SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_CLASS("_TtC9Qualtrics19QualtricsProperties")
@interface QualtricsProperties : NSObject
- (void)setStringWithString:(NSString * _Nonnull)string for:(NSString * _Nonnull)key;
- (void)setNumberWithNumber:(double)number for:(NSString * _Nonnull)key;
- (void)setDateTimeFor:(NSString * _Nonnull)key;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class NSCoder;
@protocol UIViewControllerTransitionCoordinator;
@class WKUserContentController;
@class WKScriptMessage;
@class NSBundle;

SWIFT_CLASS("_TtC9Qualtrics29QualtricsSurveyViewController")
@interface QualtricsSurveyViewController : UIViewController <WKScriptMessageHandler>
- (nonnull instancetype)initWithUrl:(NSString * _Nonnull)url autoCloseSurvey:(NSNumber * _Nullable)autoCloseSurvey OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)viewDidAppear:(BOOL)animated;
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator> _Nonnull)coordinator;
- (void)userContentController:(WKUserContentController * _Nonnull)userContentController didReceiveScriptMessage:(WKScriptMessage * _Nonnull)message;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil SWIFT_UNAVAILABLE;
@end


SWIFT_CLASS("_TtC9Qualtrics21QualtricsWebviewTheme")
@interface QualtricsWebviewTheme : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end

enum targetingResultStatus : NSInteger;
@class TargetingResultError;

SWIFT_CLASS("_TtC9Qualtrics15TargetingResult")
@interface TargetingResult : NSObject
- (NSString * _Nullable)getSurveyUrl SWIFT_WARN_UNUSED_RESULT;
- (enum targetingResultStatus)getTargetingResult SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nullable)getCreativeType SWIFT_WARN_UNUSED_RESULT;
- (void)setLastDisplayedTime;
- (BOOL)passed SWIFT_WARN_UNUSED_RESULT;
- (TargetingResultError * _Nullable)getError SWIFT_WARN_UNUSED_RESULT;
- (void)recordImpression;
- (void)recordClick;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC9Qualtrics20TargetingResultError")
@interface TargetingResultError : NSObject
- (NSString * _Nonnull)getErrorMessage SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)getErrorType SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end





typedef SWIFT_ENUM(NSInteger, targetingResultStatus, open) {
  targetingResultStatusPassed = 0,
  targetingResultStatusFailedLogic = 1,
  targetingResultStatusSampledOut = 2,
  targetingResultStatusMultipleDisplayPrevented = 3,
  targetingResultStatusError = 4,
  targetingResultStatusInactive = 5,
  targetingResultStatusContactFrequencyFailed = 6,
};

#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
#endif

#elif defined(__x86_64__) && __x86_64__
// Generated by Apple Swift version 5.5.1 (swiftlang-1300.0.31.4 clang-1300.0.29.6)
#ifndef QUALTRICS_SWIFT_H
#define QUALTRICS_SWIFT_H
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <Foundation/Foundation.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(ns_consumed)
# define SWIFT_RELEASES_ARGUMENT __attribute__((ns_consumed))
#else
# define SWIFT_RELEASES_ARGUMENT
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif
#if !defined(SWIFT_RESILIENT_CLASS)
# if __has_attribute(objc_class_stub)
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME) __attribute__((objc_class_stub))
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_class_stub)) SWIFT_CLASS_NAMED(SWIFT_NAME)
# else
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME)
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) SWIFT_CLASS_NAMED(SWIFT_NAME)
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_WEAK_IMPORT)
# define SWIFT_WEAK_IMPORT __attribute__((weak_import))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if !defined(IBSegueAction)
# define IBSegueAction
#endif
#if __has_feature(modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import CoreGraphics;
@import Foundation;
@import ObjectiveC;
@import UIKit;
@import WebKit;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="Qualtrics",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

typedef SWIFT_ENUM(NSInteger, CreativeType, open) {
  CreativeTypeNotification = 0,
  CreativeTypePopOver = 1,
  CreativeTypeEmbeddedFeedback = 2,
};

@class NSString;
@class NSNumber;

SWIFT_CLASS("_TtC9Qualtrics20InitializationResult")
@interface InitializationResult : NSObject
- (NSString * _Nullable)getMessage SWIFT_WARN_UNUSED_RESULT;
- (BOOL)passed SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end

@class QualtricsProperties;
@class QualtricsWebviewTheme;
@class TargetingResult;
@class UNNotificationResponse;
@class UIViewController;
@class UILocalNotification;

SWIFT_CLASS("_TtC9Qualtrics9Qualtrics")
@interface Qualtrics : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) Qualtrics * _Nonnull shared;)
+ (Qualtrics * _Nonnull)shared SWIFT_WARN_UNUSED_RESULT;
@property (nonatomic, readonly, strong) QualtricsProperties * _Nonnull properties;
@property (nonatomic, strong) QualtricsWebviewTheme * _Nonnull webviewTheme;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
- (void)initializeWithBrandId:(NSString * _Nonnull)brandId zoneId:(NSString * _Nonnull)zoneId interceptId:(NSString * _Nonnull)interceptId completion:(void (^ _Nullable)(InitializationResult * _Nonnull))completion SWIFT_DEPRECATED_MSG("This is being removed; please migrate to initializeProject.");
- (void)initializeProjectWithBrandId:(NSString * _Nonnull)brandId projectId:(NSString * _Nonnull)projectId extRefId:(NSString * _Nullable)extRefId completion:(void (^ _Nullable)(NSDictionary<NSString *, InitializationResult *> * _Nonnull))completion;
- (void)evaluateTargetingLogicWithCompletion:(void (^ _Nonnull)(TargetingResult * _Nonnull))completion SWIFT_DEPRECATED_MSG("This is being removed; please migrate to evaluateProject or evaluateIntercept.");
- (void)evaluateProjectWithCompletion:(void (^ _Nonnull)(NSDictionary<NSString *, TargetingResult *> * _Nonnull))completion;
- (void)evaluateInterceptFor:(NSString * _Nonnull)interceptId completion:(void (^ _Nonnull)(TargetingResult * _Nonnull))completion;
- (BOOL)handleLocalNotificationWithResponse:(UNNotificationResponse * _Nonnull)response displayOn:(UIViewController * _Nonnull)viewController SWIFT_WARN_UNUSED_RESULT SWIFT_AVAILABILITY(ios,introduced=10.0);
- (BOOL)handleLocalNotification:(UILocalNotification * _Nonnull)notification displayOn:(UIViewController * _Nonnull)viewController SWIFT_WARN_UNUSED_RESULT;
- (BOOL)displayWithViewController:(UIViewController * _Nonnull)viewController autoCloseSurvey:(NSNumber * _Nonnull)autoCloseSurvey SWIFT_WARN_UNUSED_RESULT;
- (BOOL)displayInterceptFor:(NSString * _Nonnull)interceptID viewController:(UIViewController * _Nonnull)viewController autoCloseSurvey:(NSNumber * _Nonnull)autoCloseSurvey SWIFT_WARN_UNUSED_RESULT;
- (void)displayTargetWithTargetViewController:(UIViewController * _Nonnull)targetViewController targetUrl:(NSString * _Nonnull)targetUrl autoCloseSurvey:(NSNumber * _Nonnull)autoCloseSurvey;
- (NSArray<NSString *> * _Nonnull)getInitializedIntercepts SWIFT_WARN_UNUSED_RESULT;
- (NSArray<NSString *> * _Nonnull)getPassingIntercepts SWIFT_WARN_UNUSED_RESULT;
- (void)setEmbeddedFeedbackDialogCloseListenerWithListener:(void (^ _Nullable)(void))listener;
- (BOOL)hide SWIFT_WARN_UNUSED_RESULT;
- (void)registerViewVisitWithViewName:(NSString * _Nonnull)viewName;
- (void)resetTimer;
- (void)resetViewCounter;
/// Returns the q_touchpoint value for the given intercept
/// If the given intercept has not been initialized and evaluated, this function will return a nil value.
- (NSString * _Nullable)getQualtricsContactIdWithInterceptId:(NSString * _Nonnull)interceptId SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_CLASS("_TtC9Qualtrics19QualtricsProperties")
@interface QualtricsProperties : NSObject
- (void)setStringWithString:(NSString * _Nonnull)string for:(NSString * _Nonnull)key;
- (void)setNumberWithNumber:(double)number for:(NSString * _Nonnull)key;
- (void)setDateTimeFor:(NSString * _Nonnull)key;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class NSCoder;
@protocol UIViewControllerTransitionCoordinator;
@class WKUserContentController;
@class WKScriptMessage;
@class NSBundle;

SWIFT_CLASS("_TtC9Qualtrics29QualtricsSurveyViewController")
@interface QualtricsSurveyViewController : UIViewController <WKScriptMessageHandler>
- (nonnull instancetype)initWithUrl:(NSString * _Nonnull)url autoCloseSurvey:(NSNumber * _Nullable)autoCloseSurvey OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)viewDidAppear:(BOOL)animated;
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator> _Nonnull)coordinator;
- (void)userContentController:(WKUserContentController * _Nonnull)userContentController didReceiveScriptMessage:(WKScriptMessage * _Nonnull)message;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil SWIFT_UNAVAILABLE;
@end


SWIFT_CLASS("_TtC9Qualtrics21QualtricsWebviewTheme")
@interface QualtricsWebviewTheme : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end

enum targetingResultStatus : NSInteger;
@class TargetingResultError;

SWIFT_CLASS("_TtC9Qualtrics15TargetingResult")
@interface TargetingResult : NSObject
- (NSString * _Nullable)getSurveyUrl SWIFT_WARN_UNUSED_RESULT;
- (enum targetingResultStatus)getTargetingResult SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nullable)getCreativeType SWIFT_WARN_UNUSED_RESULT;
- (void)setLastDisplayedTime;
- (BOOL)passed SWIFT_WARN_UNUSED_RESULT;
- (TargetingResultError * _Nullable)getError SWIFT_WARN_UNUSED_RESULT;
- (void)recordImpression;
- (void)recordClick;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC9Qualtrics20TargetingResultError")
@interface TargetingResultError : NSObject
- (NSString * _Nonnull)getErrorMessage SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)getErrorType SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end





typedef SWIFT_ENUM(NSInteger, targetingResultStatus, open) {
  targetingResultStatusPassed = 0,
  targetingResultStatusFailedLogic = 1,
  targetingResultStatusSampledOut = 2,
  targetingResultStatusMultipleDisplayPrevented = 3,
  targetingResultStatusError = 4,
  targetingResultStatusInactive = 5,
  targetingResultStatusContactFrequencyFailed = 6,
};

#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
#endif

#endif
