create database eStore;
--use master
--drop database eStore
go
use eStore
go
create table Categories(
	Id int primary key identity,
	Name nvarchar(50),
	NameVN nvarchar(MAX)
);

insert into Categories values ('Wacth',N'Đồng hồ')
insert into Categories values ('Laptop',N'Máy tính')
insert into Categories values ('Camera',N'Máy ảnh')
insert into Categories values ('Phone',N'Điện thoại')

go
create table Products(
	Id int primary key identity,
	Name nvarchar(60),
	UnitPrice float,
	Image nvarchar(200),
	ProductDate date,
	Available bit,
	CategoryId int foreign key references Categories(Id),
	Quantity int,
	Description nvarchar(MAX),
	Discount float,
	Viewcount int,
	Specical bit
);

insert into Products values (N'ĐỒNG HỒ 1',50,'/ARIESGOLD.jpg','10/10/2019',1,1,100,N'Chúng tôi là đơn vị uy tín nhiều năm trong lĩnh vực mua bán đồng hồ cũ chính hãng, chúng tôi mua đồng hồ cũ tại Hà Nội, Hải Phòng, Quảng Ninh và các tỉnh miền bắc… các mẫu đồng hồ có thiết kế sang trọng, phiên bản giới hạn cho đến những mẫu phổ thông đã qua sử dụng hoặc bị hỏng với giá tốt nhất. Mua đồng hồ hiệu cũ các thương hiệu cao cấp: Rolex, Longines, Omega, Tissot, Zenith, Patek philippe , Hamiton, Oris, Tag Heuler, Bretling, Cartier.. cũ đã qua sử dụng.',0,0,1)
insert into Products values (N'ĐỒNG HỒ 2',20,'/PHILIPPE.jpg','11/10/2019',1,1,50,N'Chúng tôi là đơn vị uy tín nhiều năm trong lĩnh vực mua bán đồng hồ cũ chính hãng, chúng tôi mua đồng hồ cũ tại Hà Nội, Hải Phòng, Quảng Ninh và các tỉnh miền bắc… các mẫu đồng hồ có thiết kế sang trọng, phiên bản giới hạn cho đến những mẫu phổ thông đã qua sử dụng hoặc bị hỏng với giá tốt nhất. Mua đồng hồ hiệu cũ các thương hiệu cao cấp: Rolex, Longines, Omega, Tissot, Zenith, Patek philippe , Hamiton, Oris, Tag Heuler, Bretling, Cartier.. cũ đã qua sử dụng.',0,0,1)
insert into Products values (N'ĐỒNG HỒ 3',35,'/dh2.jpg','11/10/2019',1,1,50,N'Chúng tôi là đơn vị uy tín nhiều năm trong lĩnh vực mua bán đồng hồ cũ chính hãng, chúng tôi mua đồng hồ cũ tại Hà Nội, Hải Phòng, Quảng Ninh và các tỉnh miền bắc… các mẫu đồng hồ có thiết kế sang trọng, phiên bản giới hạn cho đến những mẫu phổ thông đã qua sử dụng hoặc bị hỏng với giá tốt nhất. Mua đồng hồ hiệu cũ các thương hiệu cao cấp: Rolex, Longines, Omega, Tissot, Zenith, Patek philippe , Hamiton, Oris, Tag Heuler, Bretling, Cartier.. cũ đã qua sử dụng.',0,0,1)
insert into Products values (N'ĐỒNG HỒ 4',48,'/JACQUES.jpg','10/10/2019',1,1,100,N'Laptop ASUS VivoBook D509DA - AMD Ryzen 5 là chiếc laptop văn phòng có cấu hình mạnh, CPU AMD Ryzen 5 3500U 4 nhân 8 luồng hoạt động tốt các ứng dụng văn phòng, thậm chí có thể xử lý đồ họa nhẹ với các ứng dụng thiết kế như Photoshop, Illustrator, Corel Draw...Tuy chỉ sử dụng card đồ họa Onboard AMD Radeon Vega 8 nhưng sức mạnh của Vega 8 mạnh hơn Intel UHD rất nhiều, tiệm cận tới card rời MX230 2GB. Chính vì thế, máy có thể chiến tốt các tựa game online phổ biến hiện nay.',0,0,1)
insert into Products values (N'Máy tính DELL',75,'/dell.png','10/10/2019',1,2,100,N'Laptop ASUS VivoBook D509DA - AMD Ryzen 5 là chiếc laptop văn phòng có cấu hình mạnh, CPU AMD Ryzen 5 3500U 4 nhân 8 luồng hoạt động tốt các ứng dụng văn phòng, thậm chí có thể xử lý đồ họa nhẹ với các ứng dụng thiết kế như Photoshop, Illustrator, Corel Draw...Tuy chỉ sử dụng card đồ họa Onboard AMD Radeon Vega 8 nhưng sức mạnh của Vega 8 mạnh hơn Intel UHD rất nhiều, tiệm cận tới card rời MX230 2GB. Chính vì thế, máy có thể chiến tốt các tựa game online phổ biến hiện nay.',0,0,1)
insert into Products values (N'Máy tính ASUS',11,'/asus.png','10/10/2019',2,2,100,N'Laptop ASUS VivoBook D509DA - AMD Ryzen 5 là chiếc laptop văn phòng có cấu hình mạnh, CPU AMD Ryzen 5 3500U 4 nhân 8 luồng hoạt động tốt các ứng dụng văn phòng, thậm chí có thể xử lý đồ họa nhẹ với các ứng dụng thiết kế như Photoshop, Illustrator, Corel Draw...Tuy chỉ sử dụng card đồ họa Onboard AMD Radeon Vega 8 nhưng sức mạnh của Vega 8 mạnh hơn Intel UHD rất nhiều, tiệm cận tới card rời MX230 2GB. Chính vì thế, máy có thể chiến tốt các tựa game online phổ biến hiện nay.',0,0,1)
insert into Products values (N'Máy tính HP',22,'/hp.png','10/10/2019',1,2,100,N'Laptop ASUS VivoBook D509DA - AMD Ryzen 5 là chiếc laptop văn phòng có cấu hình mạnh, CPU AMD Ryzen 5 3500U 4 nhân 8 luồng hoạt động tốt các ứng dụng văn phòng, thậm chí có thể xử lý đồ họa nhẹ với các ứng dụng thiết kế như Photoshop, Illustrator, Corel Draw...Tuy chỉ sử dụng card đồ họa Onboard AMD Radeon Vega 8 nhưng sức mạnh của Vega 8 mạnh hơn Intel UHD rất nhiều, tiệm cận tới card rời MX230 2GB. Chính vì thế, máy có thể chiến tốt các tựa game online phổ biến hiện nay.',0,0,1)
insert into Products values (N'Camera 1',30,'/cam1.jpg','10/10/2019',1,3,5,N'Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ..',0,0,1)
insert into Products values (N'Camera 2',32,'/cam2.jpg','10/10/2019',1,3,10,N'Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ..',0,0,1)
insert into Products values (N'Camera 3',04,'/cam3.jpg','10/10/2019',1,3,3,N'Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Tuy nhiên tuỳ vào từng loại sản phẩm hoặc phương thức, địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, ..',0,0,1)
insert into Products values (N'Điện thoại 1',12,'/dt1.png','10/10/2019',1,4,3,N'Vertu Signature là một trong những dòng sản phẩm được giới doanh nhân Việt Nam đặc biệt yêu thích. Bắt nguồn cảm hứng từ những tiêu chuẩn chính xác của đồng hồ Grand Complication, Signature là một tác phẩm của tay nghề thủ công khéo léo. Mang phong cách thời trang từ những chất liệu quý hiếm như platin, vàng, kim cương và được lắp ráp hoàn toàn thủ công, Signature chắc chắn là một thiết bị cầm tay đẹp nhất từ trước đến nay.',0,0,1)
insert into Products values (N'Điện thoại 2',13,'/dt2.jpeg','10/10/2019',1,4,3,N'Vertu Signature là một trong những dòng sản phẩm được giới doanh nhân Việt Nam đặc biệt yêu thích. Bắt nguồn cảm hứng từ những tiêu chuẩn chính xác của đồng hồ Grand Complication, Signature là một tác phẩm của tay nghề thủ công khéo léo. Mang phong cách thời trang từ những chất liệu quý hiếm như platin, vàng, kim cương và được lắp ráp hoàn toàn thủ công, Signature chắc chắn là một thiết bị cầm tay đẹp nhất từ trước đến nay.',0,0,1)
insert into Products values (N'Điện thoại 3',17,'/dt3.jpg','10/10/2019',1,4,3,N'Vertu Signature là một trong những dòng sản phẩm được giới doanh nhân Việt Nam đặc biệt yêu thích. Bắt nguồn cảm hứng từ những tiêu chuẩn chính xác của đồng hồ Grand Complication, Signature là một tác phẩm của tay nghề thủ công khéo léo. Mang phong cách thời trang từ những chất liệu quý hiếm như platin, vàng, kim cương và được lắp ráp hoàn toàn thủ công, Signature chắc chắn là một thiết bị cầm tay đẹp nhất từ trước đến nay.',0,0,1)
insert into Products values (N'Điện thoại 4',99,'/dt3.jpg','10/10/2019',1,4,3,N'Vertu Signature là một trong những dòng sản phẩm được giới doanh nhân Việt Nam đặc biệt yêu thích. Bắt nguồn cảm hứng từ những tiêu chuẩn chính xác của đồng hồ Grand Complication, Signature là một tác phẩm của tay nghề thủ công khéo léo. Mang phong cách thời trang từ những chất liệu quý hiếm như platin, vàng, kim cương và được lắp ráp hoàn toàn thủ công, Signature chắc chắn là một thiết bị cầm tay đẹp nhất từ trước đến nay.',0,0,1)

go
create table Customers(
	Id nvarchar(20) primary key,
	Password nvarchar(36),
	FullName nvarchar(50),
	Email nvarchar(50),
	Photo nvarchar(100),
	Activated bit,
	Admin bit
);

insert into Customers values('ad','n123',N'tân','3rprokk@gmail.com','/tan.jpg',1,0)
insert into Customers values('user','123',N'user','3rprokk@gmail.com','/user1.jpg',1,0)
go
create table Orders(
	Id int primary key identity,
	CustomerId nvarchar(20) foreign key references Customers(Id),
	OrderDate datetime,
	Address nvarchar(60),
	Amount Float,
	Description nvarchar(1000)
);
go
create table OrderDetails(
	Id int primary key identity,
	OrderId int foreign key references Orders(Id),
	ProductId int foreign key references products(Id),
	UnitPrice float,
	Quantity int,
	Discount float
)
