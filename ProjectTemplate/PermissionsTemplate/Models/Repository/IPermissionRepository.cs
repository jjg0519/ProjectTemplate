﻿using Microsoft.EntityFrameworkCore;
using PermissionsTemplate.Models.DataModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace PermissionsTemplate.Models.Repository
{
    /// <summary>
    /// 权限仓储接口
    /// </summary>
    public interface IPermissionRepository
    {
        /// <summary>
        /// 获取角色权限
        /// </summary>
        /// <returns></returns>
        List<AuthorizePermission> GetRolePermissions();

        /// <summary>
        /// 获取全部权限
        /// </summary>
        /// <returns></returns>
        List<Permission> GetAllPermission();

        /// <summary>
        /// 添加权限
        /// </summary>
        /// <param name="permission">权限</param>
        /// <returns></returns>
         bool AddPermission(Permission permission);
        /// <summary>
        /// 修改权限
        /// </summary>
        /// <param name="permission">权限</param>
        /// <returns></returns>
        bool ModifyPermission(Permission permission);
    
        /// <summary>
        /// 修改权限
        /// </summary>
        /// <param name="permission">权限</param>
        /// <returns></returns>
         bool RemovePermission(int permissionID);

    }
}
