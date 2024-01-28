//
//  StepperView.swift
//
//  Created by ahmed hussien on 1/11/2023.
//

import SwiftUI

struct StepperView: View {
    
    var arr: [StepData]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(arr.indices, id: \.self) { item in
                VStack(alignment: .leading) {
                    HStack(spacing: 0) {
                        ZStack() {
                            Circle()
                                .fill(arr[item].isActive ? arr[item].selectionColor : arr[item].normalColor)
                                .frame(width: 50, height: 50)
                            
                            Image(arr[item].icon)
                                .foregroundColor(.white)
                                .frame(width: 50, height: 50)
                        }
                        if (arr.count - 1) != item {
                            Rectangle()
                                .fill(arr[item].isActive ? arr[item].selectionColor : arr[item].normalColor)
                                .frame(height: 2)
                        }
                    }
                    Text(arr[item].title.localized())
                        .appFont(.subheadline)
                        .foregroundColor(arr[item].isActive ? arr[item].selectionColor : arr[item].normalColor)
                        .layoutPriority(1)
                }
            }
        }
        .padding()

    }
}

#Preview {
    StepperView(arr: [
        StepData(title: "first",
                 icon: "xmark",
                 selectionColor: .blue,
                 normalColor: .gray,
                 isActive: true),
        StepData(title: "second",
                 icon: "xmark",
                 selectionColor: .blue,
                 normalColor: .gray,
                 isActive: false),
        StepData(title: "third",
                 icon: "xmark",
                 selectionColor: .blue,
                 normalColor: .gray,
                 isActive: false)
    ])
}

struct StepData {
    var title: String
    var icon: String
    var selectionColor: Color
    var normalColor: Color
    var isActive: Bool
}
