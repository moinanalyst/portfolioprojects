

select *
from portfolioproject..Nasvillhousing


select saledateconverted,CONVERT(Date,saleDate)
from portfolioproject..Nasvillhousing


update Nasvillhousing
 set saledateconverted=CONVERT(Date,saleDate)


ALTER TABLE Nasvillhousing
Add saledateconverted Date;

update Nasvillhousing
 SET saledateconverted =CONVERT(Date,saleDate)

 select saledateconverted,CONVERT(Date,saleDate)
from portfolioproject..Nasvillhousing


select PropertyAddress,ParcelID
from portfolioproject..Nasvillhousing
order by ParcelID


select a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress,ISNULL(a.PropertyAddress,b.PropertyAddress)
from portfolioproject..Nasvillhousing a
join portfolioproject..Nasvillhousing b
 on a.ParcelID=b.ParcelID
 and a.[UniqueID ]=b.[UniqueID ]
 where a.PropertyAddress is not null



 update a
 SET PropertyAddress=ISNULL(a.PropertyAddress,b.PropertyAddress)
from portfolioproject..Nasvillhousing a
join portfolioproject..Nasvillhousing b
 on a.ParcelID=b.ParcelID
 and a.[UniqueID ]=b.[UniqueID ]
 where a.PropertyAddress is not null



 select PropertyAddress
from portfolioproject..Nasvillhousing
--order by ParcelID

select 
SUBSTRING (PropertyAddress,1, CHARINDEX(',',propertyAddress)-1) as address
,SUBSTRING (PropertyAddress, CHARINDEX(',',propertyAddress)+1 ,LEN(propertyAddress)) as address
from portfolioproject..Nasvillhousing
--order by ParcelID


ALTER TABLE Nasvillhousing
Add propertyspiltaddress Nvarchar(255);

update Nasvillhousing
 SET propertyspiltaddress =SUBSTRING (PropertyAddress,1, CHARINDEX(',',propertyAddress)-1)

 
 from portfolioproject..Nasvillhousing


 select OwnerAddress
 from portfolioproject..Nasvillhousing

 select 

 PARSENAME(replace(OwnerAddress,',','.'),3) as address
 , PARSENAME(replace(OwnerAddress,',','.'),2) as city 
 , PARSENAME(replace(OwnerAddress,',','.'),1) as state

 from portfolioproject..Nasvillhousing


 ALTER TABLE Nasvillhousing
Add ownerspiltaddress Nvarchar(255);

update Nasvillhousing
 SET ownerspiltaddress =PARSENAME(replace(OwnerAddress,',','.'),3)

 ALTER TABLE Nasvillhousing
Add ownerspiltcity Nvarchar(255);

update Nasvillhousing
 SET ownerspiltcity =PARSENAME(replace(OwnerAddress,',','.'),2)

 ALTER TABLE Nasvillhousing
Add ownerspiltstate Nvarchar(255);

update Nasvillhousing
 SET ownerspiltstate =PARSENAME(replace(OwnerAddress,',','.'),1)


 select *
 from portfolioproject..Nasvillhousing


  select Distinct(SoldAsVacant),COUNT(SoldAsVacant)
 from portfolioproject..Nasvillhousing
 group by SoldAsVacant
 order by 2


 select SoldAsVacant
, CASE when SoldAsVacant = 'Y' then 'yes'
      when SoldAsVacant = 'N' then 'no'
	  ELSE SoldAsVacant
	  END
 from portfolioproject..Nasvillhousing

 update Nasvillhousing
 SET  SoldAsVacant= CASE when SoldAsVacant = 'Y' then 'yes'
      when SoldAsVacant = 'N' then 'no'
	  ELSE SoldAsVacant
	  END
 
 
  select Distinct(SoldAsVacant),COUNT(SoldAsVacant)
 from portfolioproject..Nasvillhousing
 group by SoldAsVacant
 order by 2


 select *
 from portfolioproject..Nasvillhousing

   alter table portfolioproject..Nasvillhousing
drop column PropertyAddress,ownerAddress,TaxDistrict

select *
 from portfolioproject..Nasvillhousing



  alter table portfolioproject..Nasvillhousing
drop column SaleDate

select *
 from portfolioproject..Nasvillhousing

