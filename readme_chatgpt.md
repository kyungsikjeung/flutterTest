# Firebase CLI 설치 및 Flutter Firebase 의존성 추가

이 문서는 Firebase CLI를 설치하고 Flutter 프로젝트에 Firebase 관련 의존성을 추가하는 방법을 안내합니다.

## 1. Firebase CLI 설치

Firebase CLI(Command Line Interface)는 Firebase 프로젝트를 관리하고 배포하는 데 사용되는 도구입니다. Node.js와 npm(Node Package Manager)이 설치되어 있어야 합니다.

### Node.js 및 npm 설치 확인

터미널에서 다음 명령어를 실행하여 Node.js와 npm이 설치되어 있는지 확인합니다:

```bash
node -v
npm -v
```

설치되어 있지 않다면, [Node.js 공식 웹사이트](https://nodejs.org/)에서 다운로드하여 설치합니다.

### Firebase CLI 설치

npm을 사용하여 Firebase CLI를 전역으로 설치합니다:

```bash
npm install -g firebase-tools
```

설치가 완료되면 다음 명령어로 Firebase CLI 버전을 확인하여 설치가 성공했는지 검증합니다:

```bash
firebase --version
```

### Firebase 로그인

Firebase CLI를 사용하여 Firebase에 로그인합니다:

```bash
firebase login
```

이 명령어를 실행하면 웹 브라우저가 열리고 Google 계정으로 로그인하라는 메시지가 표시됩니다. 로그인이 완료되면 터미널에 성공 메시지가 나타납니다.

## 2. Flutter 프로젝트에 Firebase 의존성 추가

Flutter 프로젝트에서 Firebase 서비스를 사용하려면 `pubspec.yaml` 파일에 필요한 Firebase 패키지를 추가해야 합니다.

### `pubspec.yaml` 파일 수정

프로젝트의 `pubspec.yaml` 파일을 열고 `dependencies:` 섹션 아래에 필요한 Firebase 패키지를 추가합니다. 일반적으로 `firebase_core`는 모든 Firebase 서비스의 기본이므로 필수로 추가해야 합니다.

예시:

```yaml
dependencies:
  flutter:
    sdk: flutter

  # Firebase Core (필수)
  firebase_core: ^2.x.x # 최신 버전으로 업데이트하세요

  # 예시: Firebase Authentication을 사용하려면
  firebase_auth: ^4.x.x # 최신 버전으로 업데이트하세요

  # 예시: Cloud Firestore를 사용하려면
  cloud_firestore: ^4.x.x # 최신 버전으로 업데이트하세요

  # 예시: Firebase Storage를 사용하려면
  firebase_storage: ^11.x.x # 최신 버전으로 업데이트하세요

  # 예시: Firebase Messaging을 사용하려면
  firebase_messaging: ^14.x.x # 최신 버전으로 업데이트하세요

  # 기타 필요한 패키지...
```

**주의:** `^` 기호는 해당 버전의 최신 마이너/패치 버전을 사용하겠다는 의미입니다. `x.x.x` 부분은 현재 사용 가능한 최신 안정 버전으로 업데이트해야 합니다. 최신 버전은 [pub.dev](https://pub.dev/)에서 각 패키지 이름을 검색하여 확인할 수 있습니다.

### 패키지 가져오기

`pubspec.yaml` 파일을 수정한 후, 터미널에서 프로젝트 루트 디렉토리로 이동하여 다음 명령어를 실행하여 의존성을 가져옵니다:

```bash
flutter pub get
```

이 명령어를 실행하면 추가된 Firebase 패키지들이 프로젝트에 다운로드되고 설정됩니다.

## 3. Firebase 프로젝트 설정 (선택 사항이지만 권장)

Flutter 프로젝트를 Firebase 프로젝트에 연결하려면 `flutterfire_cli`를 사용하는 것이 가장 편리합니다.

### `flutterfire_cli` 설치

```bash
dart pub global activate flutterfire_cli
```

### Firebase 프로젝트 연결

프로젝트 루트 디렉토리에서 다음 명령어를 실행합니다:

```bash
flutterfire configure
```

이 명령어를 실행하면 Firebase 프로젝트를 선택하고, 현재 Flutter 프로젝트에 필요한 플랫폼별 Firebase 설정 파일(예: `google-services.json` for Android, `GoogleService-Info.plist` for iOS)을 자동으로 생성하고 `lib/firebase_options.dart` 파일을 생성하여 Firebase 초기화 코드를 제공합니다.

이제 Flutter 프로젝트에서 Firebase 서비스를 사용할 준비가 완료되었습니다!