# englishtutor

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



## Flutter Version 정보
```code
flutter --version
Flutter 3.32.6 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 077b4a4ce1 (3 days ago) • 2025-07-08 13:31:08 -0700
Engine • revision 72f2b18bb0 (3 days ago) • 2025-07-08 10:33:53 -0700
Tools • Dart 3.8.1 • DevTools 2.45.1
```



| 단계 | 명령 | 설명 |
|------|------|------|
| **① 깨끗이 비우기** | `rm pubspec.lock`<br>`rm -rf .dart_tool`<br>`flutter clean` | **pubspec.lock** 과 내부 빌드 폴더를 삭제해 완전 초기화 |
| **② 캐시까지 새로 받기 (선택)** | `flutter pub cache repair` | 로컬 캐시 전체를 다시 내려받습니다.<br>*(용량·시간 여유가 있을 때만)* |
| **③ 다시 설치** | `flutter pub get --verbose` | 모든 의존성을 다시 다운로드하며 자세한 로그를 확인 |
| **④ 설치 트리 리포트** | `dart pub deps --style=tree \| less` | 종속성 트리를 트리 형태로 확인하며 스크롤(`less`) |
| **⑤ 요약 리포트** | `flutter pub outdated` | “현재 ↔ 업그레이드 ↔ 최신” 비교표 출력 |

# Fire base er
```code
defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.kyungsikjeung.englishtutor"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }
```


# android/app/build.gradle.kts
```code
android {
    compileSdk = 34              // 이미 있을 수 있음

    ndkVersion = "27.0.12077973" // ★ NDK 버전 고정
    defaultConfig {
        applicationId = "com.example.app"
        minSdk = 23              // ★ minSdkVersion 올린 부분
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    // 나머지 buildTypes, packagingOptions 등…
}
```


```code

```


# android/settings.gradle 수정 (Flutter 3.19 이후 프로젝트) 빌드시 에러
# 파이어베이스 SDK 특정 코틀린 버젼 요구
```code
plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.7.0" apply false
    id("org.jetbrains.kotlin.android") version "2.1.0" apply false   // ★ 1.8.22 → 2.1.0
}

```


# Flutter run 에러
> Error: The plugin "cloud_firestore" requires a higher minimum iOS deployment version
than your application is targeting.
To build, increase your application's deployment target to at least 13.0 as described
at https://flutter.dev/to/ios-deploy
Error running pod install
Error launching application on iPhone 16 Pro
```code
// ios/profile
// terminal 적용시 cd ios && pod install 또는 flutter clean && flutter run
platform :ios, '13.0'

```


## FlutterFire 설치
```code 
npm install -g firebase-tools
dart pub global activate flutterfire_cli
```


## Flutter fire 설치 시 문제 생길 경우
```code
# 캐시 권한 문제를 먼저 해결 (앞서 안내한 명령)
sudo chown -R $(id -u):$(id -g) ~/.npm

# 전역 설치
npm install -g firebase-tools
firebase --version   # 정상 설치 확인
```
# ㅖ
```code
# Dart 또는 Flutter SDK가 잡혀 있는 터미널에서
dart pub global activate flutterfire_cli
```
# Path 환경 변수에 pub cache 추가
```code
echo 'export PATH="$PATH:$HOME/.pub-cache/bin"' >> ~/.zshrc
source ~/.zshrc      # 변경 즉시 반영
```

# 설치 확인
```code
which flutterfire        # 경로가 출력돼야 정상
flutterfire --version    # 버전 확인 (1.x 이상이면 최신)  :contentReference[oaicite:2]{index=2}
```

#login the firebase CLI 
```code
firebase login #vice versa. firebase logout
```

# 로그인 -> FlutterFire 설정
```bash
flutterfire configure
```

```bash
 kiosk-72e3d (kiosk)                      
  kiosk-popup (kiosk-popup)                
  micro-harmony-194505 (My First Project)  
  test-5cef9 (test)                        
  vue-shop-3474e (vue-shop)                
  <create a new project>    
```
