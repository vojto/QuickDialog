//
// Copyright 2011 ESCOZ Inc  - http://escoz.com
//
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
// file except in compliance with the License. You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software distributed under
// the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
// ANY KIND, either express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//


@implementation QTableViewCell

- (QTableViewCell *)initWithReuseIdentifier:(NSString *)string {
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:string];
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.detailTextLabel.backgroundColor = [UIColor clearColor];
    CGSize valueSize = CGSizeZero;
    if (self.detailTextLabel.text!=nil)
        valueSize = [self.detailTextLabel.text sizeWithFont:self.detailTextLabel.font];

    CGSize imageSize = CGSizeZero;
    if (self.imageView!=nil)
        imageSize = self.imageView.frame.size;


    CGRect labelFrame = self.textLabel.frame;
    self.textLabel.frame = CGRectMake(labelFrame.origin.x, labelFrame.origin.y,
            self.contentView.bounds.size.width - valueSize.width - imageSize.width - 20, labelFrame.size.height);

    CGRect detailsFrame = self.detailTextLabel.frame;
    self.detailTextLabel.frame = CGRectMake(
            self.contentView.bounds.size.width - valueSize.width - 10,
            detailsFrame.origin.y, valueSize.width, detailsFrame.size.height);
}

@end