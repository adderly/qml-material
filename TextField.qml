/*
 * QML Material - An application framework implementing Material Design.
 * Copyright (C) 2014 Bogdan Cuza <bogdan.cuza@hotmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 2.1 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick 2.0

Item {
	property string placeholder
	property color color: theme.primary
	property string text: field.text

	height: units.dp(72)
	width: units.dp(200)

	states: State {
		name: "focused"
		when: field.activeFocus
		PropertyChanges {
			target: fieldPlaceholder
			font.pixelSize: units.dp(12)
			y: units.dp(16)
		}
	}

	transitions: Transition {
		from: ""
		to: "focused"
		reversible: true
		NumberAnimation {
			properties: "y, font.pixelSize"
			duration: 150
		}
	}

	TextInput {
		id: field
		height: font.pixelSize
		width: parent.width
		font.pixelSize: units.dp(16)
		y: 2*units.dp(16) + units.dp(8)
		color: theme.blackColor('text')
		font.family: theme.font.name
	}

	Label {
		id: fieldPlaceholder
		text: parent.placeholder
		font.pixelSize: units.dp(16)
		y: field.y
		font.family: theme.font.name
	}

	Rectangle {
		color: parent.color
		height: units.dp(4)
		width: field.width
		anchors.top: field.bottom
		anchors.topMargin: units.dp(8)
	}
}
