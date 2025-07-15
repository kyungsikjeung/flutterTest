# TextEditingController 정리

`TextEditingController`는 Flutter에서 텍스트 입력 필드(예: `TextField` 또는 `TextFormField`)의 텍스트를 제어하고 관리하는 데 사용되는 핵심 위젯입니다.

## 주요 역할 및 사용 목적

1.  **텍스트 값 가져오기/설정하기**: `TextField`에 현재 입력된 텍스트를 가져오거나, 프로그램적으로 텍스트를 설정할 수 있습니다.
2.  **텍스트 변경 감지**: 텍스트 필드의 내용이 변경될 때마다 알림을 받을 수 있습니다. 이를 통해 실시간으로 입력 값을 검증하거나, 다른 UI 요소를 업데이트하는 등의 작업을 수행할 수 있습니다.
3.  **커서 위치 및 선택 영역 제어**: 텍스트 필드 내에서 커서의 위치를 변경하거나, 특정 텍스트 범위를 선택할 수 있습니다.
4.  **텍스트 필드 초기화**: 텍스트 필드의 내용을 지울 때 사용됩니다.

## 사용 방법

### 1. 선언 및 초기화

일반적으로 `StatefulWidget`의 `State` 클래스 내에서 선언하고 `initState()` 메서드에서 초기화합니다.

```dart
class MyFormState extends State<MyForm> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 컨트롤러에 리스너를 추가하여 텍스트 변경을 감지할 수 있습니다.
    _controller.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // 위젯이 dispose될 때 컨트롤러도 반드시 dispose해야 메모리 누수를 방지할 수 있습니다.
    _controller.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('텍스트 필드에 입력된 값: ${_controller.text}');
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller, // TextField에 컨트롤러 연결
      decoration: InputDecoration(
        labelText: '여기에 입력하세요',
      ),
    );
  }
}
```

### 2. `TextField`에 연결

생성된 `TextEditingController` 인스턴스를 `TextField` 위젯의 `controller` 속성에 할당합니다.

```dart
TextField(
  controller: _controller,
  // ...
)
```

### 3. 텍스트 값 가져오기

`_controller.text` 속성을 사용하여 현재 텍스트 필드에 입력된 값을 가져올 수 있습니다.

```dart
String enteredText = _controller.text;
```

### 4. 텍스트 값 설정하기

`_controller.text = '새로운 값';` 또는 `_controller.value = TextEditingValue(...)`를 사용하여 텍스트 필드의 값을 프로그램적으로 설정할 수 있습니다.

```dart
_controller.text = 'Hello, Flutter!';
```

### 5. 텍스트 변경 감지 (Listener)

`addListener()` 메서드를 사용하여 텍스트 변경 이벤트를 수신할 수 있습니다.

```dart
_controller.addListener(() {
  print('텍스트 변경됨: ${_controller.text}');
});
```

### 6. 컨트롤러 해제 (`dispose()`)

메모리 누수를 방지하기 위해 `StatefulWidget`의 `dispose()` 메서드에서 반드시 `_controller.dispose()`를 호출해야 합니다.

```dart
@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
```

## 왜 이렇게 동작하지? (궁금했던 점)

*   **`TextField` 자체에 `onChanged`가 있는데 왜 `TextEditingController`를 사용해야 하나요?**
    *   `onChanged`는 텍스트가 변경될 때마다 콜백을 제공하지만, `TextEditingController`는 텍스트 필드의 **상태(텍스트, 커서, 선택 영역)**를 더 세밀하게 제어하고, 위젯 트리 외부에서도 텍스트 필드의 값에 접근하거나 변경할 수 있게 해줍니다. 예를 들어, 다른 위젯에서 버튼을 눌러 텍스트 필드의 내용을 지우거나, 초기 값을 설정할 때 `TextEditingController`가 필수적입니다.

*   **`dispose()`를 꼭 호출해야 하나요?**
    *   네, `TextEditingController`는 `ChangeNotifier`를 상속받으므로, 리스너를 등록하고 사용합니다. `dispose()`를 호출하지 않으면 위젯이 화면에서 사라진 후에도 컨트롤러가 메모리에 남아 리스너가 계속 활성화되어 메모리 누수가 발생할 수 있습니다.

## 이 코드에서 중요한 점은 뭐지?

*   **생명주기 관리**: `initState()`에서 초기화하고 `dispose()`에서 해제하는 생명주기 관리가 매우 중요합니다.
*   **단일 책임**: `TextEditingController`는 텍스트 필드의 "데이터"와 "상태"를 관리하는 데 집중합니다. UI 업데이트는 Flutter의 반응형 프레임워크에 의해 자동으로 처리됩니다.
*   **재사용성**: 하나의 컨트롤러를 여러 `TextField`에 연결할 수는 없지만, 동일한 컨트롤러를 사용하여 여러 곳에서 하나의 `TextField`의 상태를 제어할 수 있습니다.

## 수정했더니 이런 현상이 나왔어!

*   **`dispose()`를 빼먹었더니 앱이 종료될 때 경고 메시지가 나와요.**
    *   이는 메모리 누수 경고입니다. `dispose()`를 호출하여 컨트롤러를 올바르게 해제해야 합니다.
*   **`TextEditingController`를 `build` 메서드 안에서 생성했더니 입력할 때마다 텍스트가 사라져요.**
    *   `build` 메서드는 위젯이 다시 빌드될 때마다 호출됩니다. `build` 안에서 컨트롤러를 생성하면 위젯이 리빌드될 때마다 새로운 컨트롤러 인스턴스가 생성되어 이전 입력 값이 유실됩니다. 따라서 `State` 클래스의 필드로 선언하고 `initState()`에서 한 번만 초기화해야 합니다.
*   **`TextEditingController`를 사용하지 않고 `TextField`의 `initialValue`만 사용했더니 입력 후 값을 가져올 수 없어요.**
    *   `initialValue`는 `TextField`의 초기 값을 설정하는 데만 사용됩니다. 사용자의 입력에 따라 변경되는 현재 값을 가져오거나 제어하려면 반드시 `TextEditingController`를 사용해야 합니다.
