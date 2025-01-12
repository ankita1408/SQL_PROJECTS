/*


Cleaning Data in SQL Queries


*/

select * from dataclean..NashvilleHousing
---------------------------------------------------------
-- Standardize Date Format


select SaleDate,CONVERT(date,SaleDate) 
from dataclean..NashvilleHousing;

update dataclean..NashvilleHousing
set SaleDate= CONVERT(date,SaleDate);

alter table Nashvillehousing 
add SaleDateConverted Date;

update NashvillHousing
set SaleDateConverted = CONVERT(date,SaleDate);


select SaleDateConverted , CONVERT(date,SaleDate) 
from dataclean..NashvilleHousing;

-------------------------------------------------------
-- Populate Property Address data

select PropertyAddress 
from dataclean..NashvilleHousing
where PropertyAddress  is null;


select * 
from dataclean..NashvilleHousing
where PropertyAddress  is null;


select * 
from dataclean..NashvilleHousing
--where PropertyAddress  is null;
order by ParcelID;




select * 
from dataclean..NashvilleHousing a
join dataclean..NashvilleHousing b
on a.ParcelID=b.ParcelID
and a.[UniqueID ]=b.[UniqueID ];


select a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress
from dataclean..NashvilleHousing a
join dataclean..NashvilleHousing b
  on a.ParcelID=b.ParcelID
   and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null;



select a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress,
ISNULL(a.PropertyAddress,b.PropertyAddress)
from dataclean..NashvilleHousing a
join dataclean..NashvilleHousing b
  on a.ParcelID=b.ParcelID
   and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null;



update a
set PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
from dataclean..NashvilleHousing a
join dataclean..NashvilleHousing b
  on a.ParcelID=b.ParcelID
  and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null;


-------------------------------------------------------
-- Breaking out Address Individual column(address,city,state)

select PropertyAddress
from dataclean..NashvilleHousing;
--where PropertyAddress is null
--order by ParcelID

select 
SUBSTRING(PropertyAddress,1,
CHARINDEX(',',PropertyAddress)-1)as Address
,SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress)+1,LEN(PropertyAddress)) as Address
from dataclean..NashvilleHousing;





alter table Nashvillehousing 
add PropertySplitAddress Nvarchar(255);

update NashvilleHousing
set PropertySplitAddress=SUBSTRING(PropertyAddress,1,
CHARINDEX(',',PropertyAddress)-1)

alter table Nashvillehousing 
add PropertySplitcity Nvarchar(255);

update NashvilleHousing
set PropertySplitcity = SUBSTRING(PropertyAddress,
CHARINDEX(',',PropertyAddress)+1,LEN(PropertyAddress));


select * from dataclean..NashvilleHousing;


--owner address

select OwnerAddress
from dataclean..NashvilleHousing;


select PARSENAME(replace(OwnerAddress,',','.'),3),
PARSENAME(replace(OwnerAddress,',','.'),2),
PARSENAME(replace(OwnerAddress,',','.'),1)
from dataclean..NashvilleHousing;


alter table Nashvillehousing 
add OwnerSplitAddress Nvarchar(255);

update NashvilleHousing
set OwnerSplitAddress=PARSENAME(replace(OwnerAddress,',','.'),3);

alter table Nashvillehousing 
add OwnerSplitcity Nvarchar(255);

update NashvilleHousing
set OwnerSplitcity = PARSENAME(replace(OwnerAddress,',','.'),2);

alter table Nashvillehousing 
add OwnerSplitstate Nvarchar(255);

update NashvilleHousing
set OwnerSplitstate =PARSENAME(replace(OwnerAddress,',','.'),1);



select OwnerSplitAddress,Ownersplitcity,Ownersplitstate
from dataclean..NashvilleHousing;


------------------------------------------------------------------

-- Change Y and N to Yes and No in "Sold as Vacant" field

select distinct(SoldAsVacant),count(SoldAsVacant)
from dataclean..NashvilleHousing
group by SoldAsVacant
order by SoldAsVacant;


select SoldAsVacant ,
case when SoldAsVacant='Y' then 'Yes'
when SoldAsVacant='N' then 'No'
else SoldAsVacant 
end
from dataclean..NashvilleHousing;


update NashvilleHousing 
set SoldAsVacant=case when SoldAsVacant='Y' then 'Yes'
when SoldAsVacant='N' then 'No'
else SoldAsVacant 
end 


-----------------------------------------------------------------------------------------
--remove Duplicates
with  RowNumCTE as(
Select *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
					UniqueID
					) row_num
From dataclean..NashvilleHousing
)select * from RowNumCTE 
where row_num>1
order by PropertyAddress;


select * from dataclean..NashvilleHousing;



---------------------------------------------------------------------------------------------------------

-- Delete Unused Columns




Select *
From dataclean..NashvilleHousing;


ALTER TABLE dataclean..NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate
