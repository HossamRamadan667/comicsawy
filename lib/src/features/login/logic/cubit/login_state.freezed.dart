// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T sounds) success,
    required TResult Function(LoginErrorModel? loginErrorModel) fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(T sounds)? success,
    TResult? Function(LoginErrorModel? loginErrorModel)? fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T sounds)? success,
    TResult Function(LoginErrorModel? loginErrorModel)? fail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Success<T> value) success,
    required TResult Function(Fail<T> value) fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Fail<T> value)? fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Success<T> value)? success,
    TResult Function(Fail<T> value)? fail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<T, $Res> {
  factory $LoginStateCopyWith(
          LoginState<T> value, $Res Function(LoginState<T>) then) =
      _$LoginStateCopyWithImpl<T, $Res, LoginState<T>>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<T, $Res, $Val extends LoginState<T>>
    implements $LoginStateCopyWith<T, $Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IdleCopyWith<T, $Res> {
  factory _$$IdleCopyWith(_$Idle<T> value, $Res Function(_$Idle<T>) then) =
      __$$IdleCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$IdleCopyWithImpl<T, $Res>
    extends _$LoginStateCopyWithImpl<T, $Res, _$Idle<T>>
    implements _$$IdleCopyWith<T, $Res> {
  __$$IdleCopyWithImpl(_$Idle<T> _value, $Res Function(_$Idle<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Idle<T> implements Idle<T> {
  _$Idle();

  @override
  String toString() {
    return 'LoginState<$T>.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Idle<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T sounds) success,
    required TResult Function(LoginErrorModel? loginErrorModel) fail,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(T sounds)? success,
    TResult? Function(LoginErrorModel? loginErrorModel)? fail,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T sounds)? success,
    TResult Function(LoginErrorModel? loginErrorModel)? fail,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Success<T> value) success,
    required TResult Function(Fail<T> value) fail,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Fail<T> value)? fail,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Success<T> value)? success,
    TResult Function(Fail<T> value)? fail,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle<T> implements LoginState<T> {
  factory Idle() = _$Idle<T>;
}

/// @nodoc
abstract class _$$SuccessCopyWith<T, $Res> {
  factory _$$SuccessCopyWith(
          _$Success<T> value, $Res Function(_$Success<T>) then) =
      __$$SuccessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T sounds});
}

/// @nodoc
class __$$SuccessCopyWithImpl<T, $Res>
    extends _$LoginStateCopyWithImpl<T, $Res, _$Success<T>>
    implements _$$SuccessCopyWith<T, $Res> {
  __$$SuccessCopyWithImpl(
      _$Success<T> _value, $Res Function(_$Success<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sounds = freezed,
  }) {
    return _then(_$Success<T>(
      freezed == sounds
          ? _value.sounds
          : sounds // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Success<T> implements Success<T> {
  _$Success(this.sounds);

  @override
  final T sounds;

  @override
  String toString() {
    return 'LoginState<$T>.success(sounds: $sounds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Success<T> &&
            const DeepCollectionEquality().equals(other.sounds, sounds));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(sounds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessCopyWith<T, _$Success<T>> get copyWith =>
      __$$SuccessCopyWithImpl<T, _$Success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T sounds) success,
    required TResult Function(LoginErrorModel? loginErrorModel) fail,
  }) {
    return success(sounds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(T sounds)? success,
    TResult? Function(LoginErrorModel? loginErrorModel)? fail,
  }) {
    return success?.call(sounds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T sounds)? success,
    TResult Function(LoginErrorModel? loginErrorModel)? fail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(sounds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Success<T> value) success,
    required TResult Function(Fail<T> value) fail,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Fail<T> value)? fail,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Success<T> value)? success,
    TResult Function(Fail<T> value)? fail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements LoginState<T> {
  factory Success(final T sounds) = _$Success<T>;

  T get sounds;
  @JsonKey(ignore: true)
  _$$SuccessCopyWith<T, _$Success<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailCopyWith<T, $Res> {
  factory _$$FailCopyWith(_$Fail<T> value, $Res Function(_$Fail<T>) then) =
      __$$FailCopyWithImpl<T, $Res>;
  @useResult
  $Res call({LoginErrorModel? loginErrorModel});
}

/// @nodoc
class __$$FailCopyWithImpl<T, $Res>
    extends _$LoginStateCopyWithImpl<T, $Res, _$Fail<T>>
    implements _$$FailCopyWith<T, $Res> {
  __$$FailCopyWithImpl(_$Fail<T> _value, $Res Function(_$Fail<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginErrorModel = freezed,
  }) {
    return _then(_$Fail<T>(
      freezed == loginErrorModel
          ? _value.loginErrorModel
          : loginErrorModel // ignore: cast_nullable_to_non_nullable
              as LoginErrorModel?,
    ));
  }
}

/// @nodoc

class _$Fail<T> implements Fail<T> {
  _$Fail(this.loginErrorModel);

  @override
  final LoginErrorModel? loginErrorModel;

  @override
  String toString() {
    return 'LoginState<$T>.fail(loginErrorModel: $loginErrorModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Fail<T> &&
            (identical(other.loginErrorModel, loginErrorModel) ||
                other.loginErrorModel == loginErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginErrorModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailCopyWith<T, _$Fail<T>> get copyWith =>
      __$$FailCopyWithImpl<T, _$Fail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T sounds) success,
    required TResult Function(LoginErrorModel? loginErrorModel) fail,
  }) {
    return fail(loginErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(T sounds)? success,
    TResult? Function(LoginErrorModel? loginErrorModel)? fail,
  }) {
    return fail?.call(loginErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T sounds)? success,
    TResult Function(LoginErrorModel? loginErrorModel)? fail,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(loginErrorModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(Success<T> value) success,
    required TResult Function(Fail<T> value) fail,
  }) {
    return fail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Fail<T> value)? fail,
  }) {
    return fail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(Success<T> value)? success,
    TResult Function(Fail<T> value)? fail,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(this);
    }
    return orElse();
  }
}

abstract class Fail<T> implements LoginState<T> {
  factory Fail(final LoginErrorModel? loginErrorModel) = _$Fail<T>;

  LoginErrorModel? get loginErrorModel;
  @JsonKey(ignore: true)
  _$$FailCopyWith<T, _$Fail<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
