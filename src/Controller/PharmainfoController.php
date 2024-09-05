<?php
// src/Controller/PharmacieGardeController.php
namespace App\Controller;

use App\Entity\Notification;
use App\Entity\Pharmacie;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class PharmainfoController extends AbstractController
{
    #[Route('/infopharmacie/{id}', name: 'app_infopharmacie')]
   
    public function show(int $id, EntityManagerInterface $entityManager): Response
    {
        // Récupérer la pharmacie par son ID
        $pharmacie = $entityManager->getRepository(Pharmacie::class)->find($id);
        $notification = $entityManager->getRepository(Notification::class)->findAll();


        $query = $entityManager->createQuery(
            'SELECT COUNT(n.id) 
            FROM App\Entity\Notification n'
        );

        $notificationCount = $query->getSingleScalarResult();
        if (!$pharmacie) {
            throw $this->createNotFoundException('La pharmacie demandée n\'existe pas.');
        }

        // Passer les détails de la pharmacie au template
        return $this->render('info_pharmacie.html.twig', [
            'pharmacie' => $pharmacie,
            'notification_count' => $notificationCount,
            'notifications' => $notification
        ]);
    }
   
    #[Route('/logins', name: 'login_user')]
    public function log_in(AuthenticationUtils $authenticationUtils): Response
    {
        $error = $authenticationUtils->getLastAuthenticationError();

        // dernier nom d'utilisateur entré par l'utilisateur
        $lastUsername = $authenticationUtils->getLastUsername();

        return $this->render('admin/indexs.html.twig', [
            'last_username' => $lastUsername,
            'error' => $error,
        ]);
        
    }
   
}
