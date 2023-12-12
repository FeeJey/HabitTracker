//
//  plusView.swift
//  NC2_Habit Tracker
//
//  Created by Firdavs Juraev on 05/12/23.
//

import SwiftUI
import SwiftData

struct plusView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss: DismissAction

    @State private var desc: String = ""
    @State private var title: String = ""
    @State private var habitTypeId: Int = 4
    @State private var startDate: Date = Date.now
    @State private var endDate: Date = Date.now
    
    @State private var confirmationRequestPresented: Bool = false
    
    @FocusState var isTextFieldFocused: Bool
    @FocusState var isTextFieldFocused2: Bool
    
    var previousId: UUID?
    
    var body: some View {
        VStack {
            HStack {
                Button(role: .cancel) {
                    confirmationRequestPresented.toggle()
                } label: {
                    Text("Cancel")
                        .bold()
                }.confirmationDialog(
                    "If you made changes, modifications will be cancelled. Do you really want to cancel them?",
                    isPresented: $confirmationRequestPresented) {
                        Button(role: .cancel) {
                            confirmationRequestPresented.toggle()
                        } label: {
                            Text("No")
                        }
                        Button(role: .destructive) {
                            self.dismiss()
                        } label: {
                            Text("Yes")
                        }
                    } message: {
                        Text("If you made changes, modifications will be cancelled. Do you really want to cancel them?")
                    }
                Spacer()
                Button("Save") {
                    habItem(
                        type: habitType.allCases[habitTypeId],
                        desc: desc,
                        startDate: startDate,
                        endDate: endDate,
                        previousId: previousId
                    ).saveInto(modelContext, endDate)
                    self.dismiss()
                }
            }
            .padding()
            
            
            
            ScrollView(.vertical) {
                VStack(spacing: 24) {
                    VStack(alignment: .leading) {
                        Label("Habit Name", systemImage: "person.icloud")
                        VStack {
                            VStack(alignment: .leading) {
                                TextField("Brush teeth", text: $title, axis: .vertical)
                                    .focused($isTextFieldFocused)
                                    .lineLimit(1, reservesSpace: true)
                                    .labelsHidden()
                                    .padding(12)
                            }
                            .background {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(maxWidth: .infinity)
                                    .background(.regularMaterial)
                                    .opacity(0.1)
                            }
                            .onTapGesture {
                                isTextFieldFocused = true
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Label("Habit Plan:", systemImage: "square.grid.2x2")

                            Spacer()

                            HStack {
                                Picker(selection: $habitTypeId, label: Text("How Often")) {
                                    Text("Once").tag(1)
                                    Text("Twice").tag(2)
                                    Text("3 times").tag(3)
                                    Text("4 times").tag(4)
                                    Text("5 times").tag(5)
                                }
                                .pickerStyle(.menu)
                                .labelsHidden()
                                .focusable()
                                .background {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(maxWidth: .infinity)
                                        .background(.regularMaterial)
                                        .opacity(0.1)
                                }
                                Picker(selection: $habitTypeId, label: Text("Plan Type")) {
                                    Text("a Day").tag(1)
                                    Text("a Week").tag(2)
                                    Text("a Month").tag(3)
                                    Text("a Year").tag(4)
                                }
                                .pickerStyle(.menu)
                                .labelsHidden()
                                .focusable()
                                .background {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(maxWidth: .infinity)
                                        .background(.regularMaterial)
                                        .opacity(0.1)
                                }
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }

                    VStack(alignment: .leading) {
                        Label("Personal Notes", systemImage: "face.smiling.inverse")
                        VStack {
                            VStack(alignment: .leading) {
                                TextField("Start the day with fresh mouth!", text: $desc, axis: .vertical)
                                    .focused($isTextFieldFocused2)
                                    .lineLimit(4, reservesSpace: true)
                                    .labelsHidden()
                                    .padding(12)
                            }
                            .background {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(maxWidth: .infinity)
                                    .background(.regularMaterial)
                                    .opacity(0.1)
                            }
                            .onTapGesture {
                                isTextFieldFocused2 = true
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }

                
                }
                .padding(.horizontal)
            }
        }
        .navigationBarBackButtonHidden()
        .interactiveDismissDisabled()
        .onTapGesture {
            isTextFieldFocused = false
            isTextFieldFocused2 = false
        }
    }
}

#Preview {
    plusView()
}
