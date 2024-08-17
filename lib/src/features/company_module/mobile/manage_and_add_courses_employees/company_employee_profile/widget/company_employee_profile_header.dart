import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/string.dart';
import 'package:all_in_one/src/features/company_module/mobile/manage_and_add_courses_employees/employee_list/model/employee_model.dart';
import 'package:flutter/material.dart';

class CompanyEmployeeProfileHeader extends StatelessWidget {
  const CompanyEmployeeProfileHeader({
    super.key,
    required this.employee,
  });
  final EmployeeModel employee;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 133,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 5, // Increased blur radius
              offset: const Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(14),
          color: CommonColor.whiteColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO: Update the image when the api is ready
            Container(
              height: 115,
              width: 115,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4FA),
                borderRadius: BorderRadius.circular(10),
              ),
              child: employee.image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        employee.image!,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(noImageFound);
                        },
                      ),
                    )
                  : Text(
                      getInitials(employee.name ?? ''),
                      style: const TextStyle(
                        color: Color(0xFF5A5959),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    employee.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 20 / 17,
                    ),
                  ),
                  // const SizedBox(height: 10),
                  Text(
                    "Designation : ${employee.degination ?? '-'}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87,
                      height: 15 / 14,
                    ),
                  ),
                  //  const SizedBox(height: 10),
                  Text(
                    "Number : ${employee.phone ?? '-'}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87,
                      height: 15 / 14,
                    ),
                  ),
                  // const SizedBox(height: 10),
                  Text(
                    "Email : ${employee.username ?? '-'}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87,
                      height: 15 / 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getInitials(String name) => name.isNotEmpty
      ? name.trim().split(' ').map((l) => l[0]).take(2).join()
      : '';
}
