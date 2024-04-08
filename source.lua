function elements:Multibox(options)
                    if not options.text or not options.default or not options.list or not options.callback then Notify("Multibox", "Missing arguments!") return end

                    local DropYSize = 0
                    local Dropped = false

                    local Multibox = Instance.new("Frame")
                    local multiboxLabel = Instance.new("TextLabel")
                    local multiboxText = Instance.new("TextLabel")
                    local multiboxArrow = Instance.new("ImageButton")
                    local multiboxList = Instance.new("Frame")

                    local multiListLayout = Instance.new("UIListLayout")
                    buttoneffect({frame = multiboxLabel, entered = Multibox})

                    Multibox.Name = "Multibox"
                    Multibox.Parent = sectionFrame
                    Multibox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Multibox.BackgroundTransparency = 1.000
                    Multibox.BorderSizePixel = 0
                    Multibox.Position = UDim2.new(0.0697674453, 0, 0.237037033, 0)
                    Multibox.Size = UDim2.new(0, 200, 0, 22)
                    Multibox.ZIndex = 2

                    multiboxLabel.Name = "multiboxLabel"
                    multiboxLabel.Parent = Multibox
                    multiboxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    multiboxLabel.BackgroundTransparency = 1.000
                    multiboxLabel.BorderSizePixel = 0
                    multiboxLabel.Size = UDim2.new(0, 105, 0, 22)
                    multiboxLabel.Font = Enum.Font.Gotham
                    multiboxLabel.Text = " " .. options.text
                    multiboxLabel.TextColor3 = Color3.fromRGB(157, 171, 182)
                    multiboxLabel.TextSize = 14.000
                    multiboxLabel.TextXAlignment = Enum.TextXAlignment.Left
                    multiboxLabel.TextWrapped = true

                    multiboxText.Name = "multiboxText"
                    multiboxText.Parent = multiboxLabel
                    multiboxText.BackgroundColor3 = Color3.fromRGB(2, 5, 12)
                    multiboxText.Position = UDim2.new(1.08571434, 0, 0.0909090936, 0)
                    multiboxText.Size = UDim2.new(0, 87, 0, 18)
                    multiboxText.Font = Enum.Font.Gotham
                    multiboxText.Text = " " .. options.default
                    multiboxText.TextColor3 = Color3.fromRGB(234, 239, 245)
                    multiboxText.TextSize = 12.000
                    multiboxText.TextXAlignment = Enum.TextXAlignment.Left
                    multiboxText.TextWrapped = true

                    multiboxArrow.Name = "multiboxArrow"
                    multiboxArrow.Parent = multiboxText
                    multiboxArrow.BackgroundColor3 = Color3.fromRGB(2, 5, 12)
                    multiboxArrow.BorderSizePixel = 0
                    multiboxArrow.Position = UDim2.new(0.87356323, 0, 0.138888866, 0)
                    multiboxArrow.Size = UDim2.new(0, 11, 0, 13)
                    multiboxArrow.AutoButtonColor = false
                    multiboxArrow.Image = "rbxassetid://8008296380"
                    multiboxArrow.ImageColor3 = Color3.fromRGB(157, 171, 182)

                    multiboxArrow.MouseButton1Click:Connect(function()
                        Dropped = not Dropped
                        if Dropped then
                            if multiboxLabel.TextColor3 ~= Color3.fromRGB(234, 239, 245) then
                                TweenService:Create(multiboxLabel, TweenInfo.new(0.06, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                                    TextColor3 = Color3.fromRGB(234, 239, 246)
                                }):Play()
                            end
                            TweenService:Create(multiboxList, TweenInfo.new(0.06, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                                Size = UDim2.new(0, 87, 0, DropYSize)
                            }):Play()
                            TweenService:Create(multiboxList, TweenInfo.new(0.06, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                                BorderSizePixel = 1
                            }):Play()
                        elseif not Dropped then
                            if multiboxLabel.TextColor3 ~= Color3.fromRGB(157, 171, 182) then
                                TweenService:Create(multiboxLabel, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                                    TextColor3 = Color3.fromRGB(157, 171, 182)
                                }):Play()
                            end
                            TweenService:Create(multiboxList, TweenInfo.new(0.06, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                                Size = UDim2.new(0, 87, 0, 0)
                            }):Play()
                            TweenService:Create(multiboxList, TweenInfo.new(0.06, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                                BorderSizePixel = 0
                            }):Play()
                        end
                    end)

                    multiboxList.Name = "multiboxList"
                    multiboxList.Parent = dropdownText
                    multiboxList.BackgroundColor3 = Color3.fromRGB(2, 5, 12)
                    multiboxList.Position = UDim2.new(0, 0, 1, 0)
                    multiboxList.Size = UDim2.new(0, 87, 0, 0)
                    multiboxList.ClipsDescendants = true
                    multiboxList.BorderSizePixel = 0
                    multiboxList.ZIndex = 10

                    multiListLayout.Name = "multiListLayout"
                    multiListLayout.Parent = dropdownList
                    multiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                    Resize(25)

                    for i,v in next, options.list do
                        local multiboxBtn = Instance.new("TextButton")
                        local Count = 1

                        multiboxBtn.Name = "multiboxBtn"
                        multiboxBtn.Parent = multiboxList
                        multiboxBtn.BackgroundColor3 = Color3.fromRGB(234, 239, 245)
                        multiboxBtn.BackgroundTransparency = 1.000
                        multiboxBtn.BorderSizePixel = 0
                        multiboxBtn.Position = UDim2.new(-0.0110929646, 0, 0.0305557251, 0)
                        multiboxBtn.Size = UDim2.new(0, 87, 0, 18)
                        multiboxBtn.AutoButtonColor = false
                        multiboxBtn.Font = Enum.Font.Gotham
                        multiboxBtn.TextColor3 = Color3.fromRGB(234, 239, 245)
                        multiboxBtn.TextSize = 12.000
                        multiboxBtn.Text = v
                        multiboxBtn.ZIndex = 15
                        clickEffect({button = multiboxBtn, amount = 5})

                        Count = Count + 1
                        multiboxList.ZIndex -= Count
                        DropYSize = DropYSize + 18

                        multiboxBtn.MouseButton1Click:Connect(function()
                            multiboxText.Text = " " .. v
                            options.callback(v)
                        end)
                    end
                end
