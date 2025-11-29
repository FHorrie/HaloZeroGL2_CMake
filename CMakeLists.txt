cmake_minimum_required(VERSION 3.23)
project(HaloZeroGL)

# Env names, to be used with '${}'
set(TARGET_NAME halozero)
set(SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)

# Add cmake libraries file
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
include(ProjectLibs)

# PROJECT
# Add project executable.
add_executable(${TARGET_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

# Use Libraries file and fetch / find all needed libs
load_libs()

# Add source to this project's executable.
# target_sources(${TARGET_NAME} 
# 	PRIVATE ${SOURCE_DIR}/CMakeTest.h		PRIVATE ${SOURCE_DIR}/CMakeTest.cpp)

target_sources(${TARGET_NAME} PRIVATE
	${SOURCE_DIR}/Engine/base.h
	${SOURCE_DIR}/Engine/BaseGame.h					${SOURCE_DIR}/Engine/BaseGame.cpp
	${SOURCE_DIR}/Engine/Matrix2x3.h				${SOURCE_DIR}/Engine/Matrix2x3.cpp
	${SOURCE_DIR}/Engine/SoundEffect.h				${SOURCE_DIR}/Engine/SoundEffect.cpp
	${SOURCE_DIR}/Engine/SoundStream.h				${SOURCE_DIR}/Engine/SoundStream.cpp
	${SOURCE_DIR}/Engine/structs.h					${SOURCE_DIR}/Engine/structs.cpp
	${SOURCE_DIR}/Engine/SVGParser.h				${SOURCE_DIR}/Engine/SVGParser.cpp
	${SOURCE_DIR}/Engine/Texture.h					${SOURCE_DIR}/Engine/Texture.cpp
	${SOURCE_DIR}/Engine/utils.h					${SOURCE_DIR}/Engine/utils.cpp
	${SOURCE_DIR}/Engine/Vector2f.h					${SOURCE_DIR}/Engine/Vector2f.cpp

	# Sprites
	${SOURCE_DIR}/HaloZero/StaticSprite.h			${SOURCE_DIR}/HaloZero/StaticSprite.cpp
	${SOURCE_DIR}/HaloZero/AnimatedSprite.h			${SOURCE_DIR}/HaloZero/AnimatedSprite.cpp
	${SOURCE_DIR}/HaloZero/EnvironmentSprite.h		${SOURCE_DIR}/HaloZero/EnvironmentSprite.cpp
	${SOURCE_DIR}/HaloZero/CasingSprite.h			${SOURCE_DIR}/HaloZero/CasingSprite.cpp
	
	# Game Systems
	${SOURCE_DIR}/HaloZero/main.cpp
	${SOURCE_DIR}/HaloZero/Game.h					${SOURCE_DIR}/HaloZero/Game.cpp
	${SOURCE_DIR}/HaloZero/Level.h					${SOURCE_DIR}/HaloZero/Level.cpp
	${SOURCE_DIR}/HaloZero/Camera.h					${SOURCE_DIR}/HaloZero/Camera.cpp
	${SOURCE_DIR}/HaloZero/Screen.h					${SOURCE_DIR}/HaloZero/Screen.cpp
	${SOURCE_DIR}/HaloZero/HUD.h					${SOURCE_DIR}/HaloZero/HUD.cpp
	${SOURCE_DIR}/HaloZero/SoundManager.h			${SOURCE_DIR}/HaloZero/SoundManager.cpp
	${SOURCE_DIR}/HaloZero/StaticTextures.h			${SOURCE_DIR}/HaloZero/StaticTextures.cpp

	# Constants
	${SOURCE_DIR}/HaloZero/Constants.h				
	${SOURCE_DIR}/HaloZero/debugpch.h
	${SOURCE_DIR}/HaloZero/pch.h
	
	# Entities
	${SOURCE_DIR}/HaloZero/Projectile.h				${SOURCE_DIR}/HaloZero/Projectile.cpp
	${SOURCE_DIR}/HaloZero/GunPickup.h				${SOURCE_DIR}/HaloZero/GunPickup.cpp

	# Player
	${SOURCE_DIR}/HaloZero/MasterChiefBase.h		${SOURCE_DIR}/HaloZero/MasterChiefBase.cpp
	${SOURCE_DIR}/HaloZero/MasterChiefLegs.h		${SOURCE_DIR}/HaloZero/MasterChiefLegs.cpp
	${SOURCE_DIR}/HaloZero/MasterChiefTorso.h		${SOURCE_DIR}/HaloZero/MasterChiefTorso.cpp

	# Enemies
	${SOURCE_DIR}/HaloZero/EnemyBase.h				${SOURCE_DIR}/HaloZero/EnemyBase.cpp
	${SOURCE_DIR}/HaloZero/EliteRifle.h				${SOURCE_DIR}/HaloZero/EliteRifle.cpp
	${SOURCE_DIR}/HaloZero/ImpPistol.h				${SOURCE_DIR}/HaloZero/ImpPistol.cpp
	${SOURCE_DIR}/HaloZero/ImpNeedle.h				${SOURCE_DIR}/HaloZero/ImpNeedle.cpp
	${SOURCE_DIR}/HaloZero/Jackal.h					${SOURCE_DIR}/HaloZero/Jackal.cpp
	${SOURCE_DIR}/HaloZero/Hunter.h					${SOURCE_DIR}/HaloZero/Hunter.cpp

)

target_include_directories(${TARGET_NAME} PUBLIC
	${SOURCE_DIR}/Engine
	${SOURCE_DIR}/HaloZero
)

# enable c++20 features
target_compile_features(${TARGET_NAME} PUBLIC cxx_std_20)
set_property(TARGET ${TARGET_NAME} PROPERTY
	CXX_STANDARD 20
	CXX_STANDARD_REQUIRED TRUE
	CXX_EXTENSIONS FALSE
)

# compile at max warning level + treat warnings as errors
target_compile_options(${TARGET_NAME} PUBLIC
  $<$<CXX_COMPILER_ID:MSVC>:/W4 /WX /MP>
  $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:-Wall -Wextra -Wpedantic -Werror>
)

target_link_libraries(${TARGET_NAME} PUBLIC 
	SDL2::SDL2
	SDL2::SDL2main
	SDL2_ttf::SDL2_ttf
    SDL2_image::SDL2_image
)
