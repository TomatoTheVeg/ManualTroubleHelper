﻿// <auto-generated />
using System;
using ManualTroubleHelper.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace ManualTroubleHelper.Migrations
{
    [DbContext(typeof(FAQContext))]
    [Migration("20240525005630_InitialCreate")]
    partial class InitialCreate
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "8.0.5")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("ManualTroubleHelper.Model.Problem", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Description")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Tags")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Problems");
                });

            modelBuilder.Entity("ManualTroubleHelper.Model.Solution", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("Downvotes")
                        .HasColumnType("int")
                        .HasAnnotation("Relational:JsonPropertyName", "downvotes");

                    b.Property<int?>("ProblemId")
                        .HasColumnType("int");

                    b.Property<int>("Upvotes")
                        .HasColumnType("int")
                        .HasAnnotation("Relational:JsonPropertyName", "upvotes");

                    b.HasKey("Id");

                    b.HasIndex("ProblemId");

                    b.ToTable("Solutions");
                });

            modelBuilder.Entity("ManualTroubleHelper.Model.Step", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Command")
                        .HasColumnType("nvarchar(max)")
                        .HasAnnotation("Relational:JsonPropertyName", "code");

                    b.Property<string>("Description")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasAnnotation("Relational:JsonPropertyName", "description");

                    b.Property<string>("ImageUrl")
                        .HasColumnType("nvarchar(max)")
                        .HasAnnotation("Relational:JsonPropertyName", "imageUrl");

                    b.Property<int?>("SolutionId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("SolutionId");

                    b.ToTable("Steps");
                });

            modelBuilder.Entity("ManualTroubleHelper.Model.Solution", b =>
                {
                    b.HasOne("ManualTroubleHelper.Model.Problem", null)
                        .WithMany("Solutions")
                        .HasForeignKey("ProblemId");
                });

            modelBuilder.Entity("ManualTroubleHelper.Model.Step", b =>
                {
                    b.HasOne("ManualTroubleHelper.Model.Solution", null)
                        .WithMany("Steps")
                        .HasForeignKey("SolutionId");
                });

            modelBuilder.Entity("ManualTroubleHelper.Model.Problem", b =>
                {
                    b.Navigation("Solutions");
                });

            modelBuilder.Entity("ManualTroubleHelper.Model.Solution", b =>
                {
                    b.Navigation("Steps");
                });
#pragma warning restore 612, 618
        }
    }
}
